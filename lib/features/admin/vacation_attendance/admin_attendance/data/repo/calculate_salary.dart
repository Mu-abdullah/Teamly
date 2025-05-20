import 'package:flutter/material.dart';
import 'package:teamly/core/entities/company_policy.dart';
import 'package:teamly/core/services/status/vactions_typs.dart';
import 'package:teamly/features/admin/vacation_attendance/admin_attendance/data/model/month_admin_attendance.dart';
import 'package:teamly/features/admin/vacation_attendance/admin_attendance/data/model/vacation_monthly_records_model.dart';
import 'package:teamly/features/admin/vacation_attendance/admin_attendance/data/repo/admin_attendance_repo.dart';

import 'package:intl/intl.dart';

class SalaryCalculator {
  static Map<String, Map<String, dynamic>> calculateMonthlySalaries({
    required MonthlyReport report,
    required String month, // Format: YYYY-MM
    required Map<String, double>
    baseSalaries, // Employee ID to base salary mapping
    required CompanyPolicy policy, // Company-specific policy
    double deductionRatePerAbsentDay =
        1.0, // Multiplier of daily rate, adjust as needed
    double penaltyRatePerHour =
        0.125, // 1/8 of daily rate per hour, adjust as needed
    bool useCustomPayrollPeriod = false, // Option for 26th to 25th period
  }) {
    final Map<String, Map<String, dynamic>> salaryReport = {};

    // Parse month to determine total days
    final yearMonth = month.split('-');
    final year = int.parse(yearMonth[0]);
    final monthNum = int.parse(yearMonth[1]);
    final firstDayOfMonth =
        useCustomPayrollPeriod
            ? DateTime(year, monthNum - 1, 26)
            : DateTime(year, monthNum, 1);
    final lastDayOfMonth =
        useCustomPayrollPeriod
            ? DateTime(year, monthNum, 25)
            : DateTime(year, monthNum + 1, 0);

    // Fixed total days to 30 for all months as per policy
    final totalDays = 30;

    // Count weekly holidays in the period
    int weeklyHolidayCount = 0;
    for (
      var day = firstDayOfMonth;
      day.isBefore(lastDayOfMonth.add(const Duration(days: 1)));
      day = day.add(const Duration(days: 1))
    ) {
      final dayName = DateFormat('EEEE').format(day);
      if ((policy.weeklyOffDays ?? []).contains(dayName)) {
        weeklyHolidayCount++;
      }
    }

    // Count official holidays in the period
    int officialHolidayCount = 0;
    final List<DateTime> officialHolidayDates = [];
    for (var holiday in policy.officialHolidays ?? []) {
      if (holiday.isAfter(firstDayOfMonth.subtract(const Duration(days: 1))) &&
          holiday.isBefore(lastDayOfMonth.add(const Duration(days: 1)))) {
        final holidayDayName = DateFormat('EEEE').format(holiday);
        if (!(policy.weeklyOffDays ?? []).contains(holidayDayName)) {
          officialHolidayCount++;
          officialHolidayDates.add(holiday);
        }
      }
    }

    // Group approved vacations by employee and calculate total approved leave days per employee
    final Map<String, List<VacationMonthlyRecordsModel>> vacationsByEmp = {};
    final Map<String, int> vacationDaysByEmp = {};
    for (var vac in report.vacationRecords) {
      if (vac.status == VacationStatus.approved) {
        final empId = vac.empId;
        vacationsByEmp.putIfAbsent(empId!, () => []).add(vac);
        // Calculate vacation days for this employee
        int vacDays = _calculateVacationDaysInPeriod(
          vacationsByEmp[empId] ?? [],
          firstDayOfMonth,
          lastDayOfMonth,
        );
        vacationDaysByEmp[empId] = vacDays;
      }
    }

    // Calculate base working days (30 - weekly holidays - official holidays)
    final baseWorkingDays =
        totalDays - weeklyHolidayCount - officialHolidayCount;

    // Group attendance by employee and track attendance on holidays (weekly or official)
    final Map<String, List<MonthAdminAttendance>> attendanceByEmp = {};
    final Map<String, List<DateTime>> weeklyHolidayAttendanceByEmp = {};
    final Map<String, List<DateTime>> officialHolidayAttendanceByEmp = {};
    for (var att in report.attendanceRecords) {
      final empId = att.userId;
      if (att.checkOut == null || att.checkOut!.isEmpty) {
        continue;
      }
      attendanceByEmp.putIfAbsent(empId!, () => []).add(att);

      // Check if attendance date is a weekly holiday or official holiday
      try {
        final attDate = DateTime.parse(att.date ?? '1970-01-01');
        final dayName = DateFormat('EEEE').format(attDate);
        if ((policy.weeklyOffDays ?? []).contains(dayName)) {
          weeklyHolidayAttendanceByEmp
              .putIfAbsent(empId, () => [])
              .add(attDate);
        }
        if (officialHolidayDates.any(
          (holiday) =>
              holiday.year == attDate.year &&
              holiday.month == attDate.month &&
              holiday.day == attDate.day,
        )) {
          officialHolidayAttendanceByEmp
              .putIfAbsent(empId, () => [])
              .add(attDate);
        }
      } catch (e) {
        debugPrint(
          'Error parsing attendance date for holiday check: ${att.date}, Error: $e',
        );
      }
    }

    // Calculate salary for each employee
    final allEmpIds = {...attendanceByEmp.keys, ...vacationsByEmp.keys};
    for (var empId in allEmpIds) {
      final baseSalary = baseSalaries[empId] ?? 0.0;
      if (baseSalary == 0.0) {
        salaryReport[empId] = {
          'name':
              attendanceByEmp[empId]?.first.emp?.name ??
              vacationsByEmp[empId]?.first.empId ??
              'Unknown',
          'error': 'Base salary not found',
          'baseSalary': 0.0,
          'attendedDays': 0,
          'regularAttendedDays': 0,
          'weeklyHolidayAttendedDays': 0,
          'officialHolidayAttendedDays': 0,
          'vacationDays': 0,
          'absentDays': 0,
          'totalWorkingDays': baseWorkingDays,
          'regularAttendancePay': 0.0,
          'weeklyHolidayPay': 0.0,
          'officialHolidayPay': 0.0,
          'vacationPay': 0.0,
          'absenceDeduction': 0.0,
          'latePenalty': 0.0,
          'totalSalary': 0.0,
        };
        continue;
      }

      // Calculate attended days (total including holidays)
      final attendedDays = attendanceByEmp[empId]?.length ?? 0;
      final weeklyHolidayAttendedDays =
          weeklyHolidayAttendanceByEmp[empId]?.length ?? 0;
      final officialHolidayAttendedDays =
          officialHolidayAttendanceByEmp[empId]?.length ?? 0;
      final regularAttendedDays =
          attendedDays -
          weeklyHolidayAttendedDays -
          officialHolidayAttendedDays;

      // Calculate approved vacation days for this employee
      final vacationDays = vacationDaysByEmp[empId] ?? 0;

      // Calculate total working days for this employee (base working days + approved leave)
      final totalWorkingDaysForEmp = baseWorkingDays + vacationDays;

      // Calculate absent days (total working days for employee - regular attended days)
      final absentDays = (totalWorkingDaysForEmp - regularAttendedDays).clamp(
        0,
        totalWorkingDaysForEmp,
      );

      // Calculate salary components
      // Use 30 days for daily rate as per policy ((salary / 30) * 2)
      final dailyRate = baseSalary / 30;
      final regularAttendancePay = dailyRate * regularAttendedDays;
      final weeklyHolidayPay =
          weeklyHolidayAttendedDays *
          dailyRate *
          2; // Double pay for weekly holidays
      final officialHolidayPay =
          officialHolidayAttendedDays *
          dailyRate *
          2; // Double pay for official holidays
      final vacationPay =
          dailyRate * vacationDays; // Paid leave at regular rate
      final absenceDeduction =
          dailyRate * absentDays * deductionRatePerAbsentDay;

      final totalSalaryBeforePenalty = (regularAttendancePay +
              weeklyHolidayPay +
              officialHolidayPay +
              vacationPay -
              absenceDeduction)
          .clamp(0.0, baseSalary);

      // Late arrival or early departure penalties
      final latePenalty = _calculateLatePenalty(
        attendanceByEmp[empId] ?? [],
        dailyRate,
        penaltyRatePerHour,
        policy.workStartTime,
        policy.workEndTime,
        policy.gracePeriod ?? 0,
      );

      final finalSalary = (totalSalaryBeforePenalty - latePenalty).clamp(
        0.0,
        baseSalary,
      );

      salaryReport[empId] = {
        'name':
            attendanceByEmp[empId]?.first.emp?.name ??
            vacationsByEmp[empId]?.first.empId ??
            'Unknown',
        'baseSalary': baseSalary,
        'attendedDays': attendedDays,
        'regularAttendedDays': regularAttendedDays,
        'weeklyHolidayAttendedDays': weeklyHolidayAttendedDays,
        'officialHolidayAttendedDays': officialHolidayAttendedDays,
        'vacationDays': vacationDays,
        'absentDays': absentDays,
        'totalWorkingDays': totalWorkingDaysForEmp,
        'regularAttendancePay': regularAttendancePay,
        'weeklyHolidayPay': weeklyHolidayPay,
        'officialHolidayPay': officialHolidayPay,
        'vacationPay': vacationPay,
        'absenceDeduction': absenceDeduction,
        'latePenalty': latePenalty,
        'totalSalary': finalSalary,
      };
    }

    return salaryReport;
  }

  static int _calculateVacationDaysInPeriod(
    List<VacationMonthlyRecordsModel> vacations,
    DateTime periodStart,
    DateTime periodEnd,
  ) {
    int totalDays = 0;
    for (var vac in vacations) {
      try {
        final start = DateTime.parse(vac.startDate ?? '1970-01-01');
        final end = DateTime.parse(vac.endDate ?? '1970-01-01');
        final effectiveStart =
            start.isBefore(periodStart) ? periodStart : start;
        final effectiveEnd = end.isAfter(periodEnd) ? periodEnd : end;
        if (effectiveStart.isBefore(
          effectiveEnd.add(const Duration(days: 1)),
        )) {
          totalDays += effectiveEnd.difference(effectiveStart).inDays + 1;
        }
      } catch (e) {
        debugPrint('Error parsing vacation dates for calculation: $e');
      }
    }
    return totalDays;
  }

  static double _calculateLatePenalty(
    List<MonthAdminAttendance> attendances,
    double dailyRate,
    double penaltyRatePerHour,
    TimeOfDay? workStartTime,
    TimeOfDay? workEndTime,
    int gracePeriodMinutes,
  ) {
    double penalty = 0.0;

    for (var att in attendances) {
      try {
        if (att.checkIn != null && workStartTime != null) {
          final checkInParts = att.checkIn!.split(':');
          final checkInHour = int.parse(checkInParts[0]);
          final checkInMinute = int.parse(checkInParts[1]);
          final checkInTime = DateTime(1970, 1, 1, checkInHour, checkInMinute);
          final expectedStart = DateTime(
            1970,
            1,
            1,
            workStartTime.hour,
            workStartTime.minute,
          );
          final lateMinutes = checkInTime.difference(expectedStart).inMinutes;
          if (lateMinutes > gracePeriodMinutes) {
            final lateHours = (lateMinutes - gracePeriodMinutes) / 60.0;
            penalty += lateHours * penaltyRatePerHour * dailyRate;
          }
        }
        if (att.checkOut != null &&
            att.checkOut!.isNotEmpty &&
            workEndTime != null) {
          final checkOutParts = att.checkOut!.split(':');
          final checkOutHour = int.parse(checkOutParts[0]);
          final checkOutMinute = int.parse(checkOutParts[1]);
          final checkOutTime = DateTime(
            1970,
            1,
            1,
            checkOutHour,
            checkOutMinute,
          );
          final expectedEnd = DateTime(
            1970,
            1,
            1,
            workEndTime.hour,
            workEndTime.minute,
          );
          final earlyMinutes = expectedEnd.difference(checkOutTime).inMinutes;
          if (earlyMinutes > gracePeriodMinutes) {
            final earlyHours = (earlyMinutes - gracePeriodMinutes) / 60.0;
            penalty += earlyHours * penaltyRatePerHour * dailyRate;
          }
        }
      } catch (e) {
        debugPrint('Error calculating late/early penalty: $e');
      }
    }
    return penalty;
  }
}
