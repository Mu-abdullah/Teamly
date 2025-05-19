import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:teamly/core/services/supabase/backend_points.dart';

import '../../../../../../core/entities/company_policy.dart';
import '../../../data/repo/admin_attendance_repo.dart';
import '../../../data/repo/calculate_salary.dart';

part 'month_attendance_state.dart';

class MonthAttendanceCubit extends Cubit<MonthAttendanceState> {
  final AdminAttendanceRepository repo;
  final SupabaseClient supabase = Supabase.instance.client;

  MonthAttendanceCubit(this.repo) : super(MonthAttendanceInitial());

  Future<void> getMonthAttendance({
    required String compId,
    required String month,
  }) async {
    try {
      emit(MonthAttendanceLoading());
      final result = await repo.getAttendanceAndVacationByMonth(
        compId: compId,
        month: month,
      );
      result.fold(
        (error) {
          if (!isClosed) {
            emit(MonthAttendanceError(error.message));
          }
        },
        (report) {
          if (!isClosed) {
            emit(MonthAttendanceLoaded(report));
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(MonthAttendanceError('Unexpected error: $e'));
      }
    }
  }

  Future<void> fetchCompanyPolicyAndCalculateSalaries({
    required MonthlyReport report,
    required String month,
    required String compId,
    bool useCustomPayrollPeriod = false,
  }) async {
    try {
      if (!isClosed) {
        emit(MonthAttendanceLoading());

        // Fetch company policy from Supabase
        final policyResponse =
            await supabase
                .from(BackendPoint.companyPolicies)
                .select()
                .eq('comp_id', compId)
                .single();

        final policy = CompanyPolicy.fromJson(policyResponse);

        // Build baseSalaries map from attendance records
        final Map<String, double> baseSalaries = {};
        for (var att in report.attendanceRecords) {
          final empId = att.userId;
          final salary =
              att.emp?.salary ?? 0.0; // Assuming salary is a field in emp
          if (empId != null && !baseSalaries.containsKey(empId)) {
            baseSalaries[empId] = double.parse(salary.toString());
          }
        }
        // Also check vacation records for employees not in attendance
        for (var vac in report.vacationRecords) {
          final empId = vac.empId;
          // Assuming emp data might be available in vacation records; adjust if not
          if (empId != null && !baseSalaries.containsKey(empId)) {
            baseSalaries[empId] = 0.0; // Default if salary not available
          }
        }

        // Calculate salaries with fetched data
        final salaryReport = SalaryCalculator.calculateMonthlySalaries(
          report: report,
          month: month,
          baseSalaries: baseSalaries,
          policy: policy,
          deductionRatePerAbsentDay: 1.0, // Adjust as needed
          penaltyRatePerHour: 0.125, // Adjust as needed
          useCustomPayrollPeriod: useCustomPayrollPeriod,
        );
        emit(MonthAttendanceSalaryCalculated(report, salaryReport));
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          MonthAttendanceError(
            'Error fetching policy or calculating salaries: $e',
          ),
        );
      }
    }
  }
}
