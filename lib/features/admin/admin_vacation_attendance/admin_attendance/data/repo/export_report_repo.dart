import 'package:teamly/core/functions/timestamp_to_time.dart';

import '../../../../../../core/functions/excel_export_utils.dart';
import '../model/month_admin_attendance.dart';

class ExportReportRepo {
  Future<void> exportEmployees({
    required List<MonthAdminAttendance> employees,
    required String excelName,
  }) async {
    final columns = [
      ExcelColumn<MonthAdminAttendance>(
        header: 'م',
        dataGetter: (emp) => employees.indexOf(emp) + 1,
      ),
      ExcelColumn<MonthAdminAttendance>(
        header: 'اليوم',
        dataGetter: (emp) => emp.date,
      ),
      ExcelColumn<MonthAdminAttendance>(
        header: 'رقم القيد',
        dataGetter: (emp) => emp.id,
      ),
      ExcelColumn<MonthAdminAttendance>(
        header: 'الاسم',
        dataGetter: (emp) => emp.emp!.name,
      ),
      ExcelColumn<MonthAdminAttendance>(
        header: 'الوظيفة',
        dataGetter: (emp) => emp.emp!.position,
      ),
      ExcelColumn<MonthAdminAttendance>(
        header: 'وقت الدخول',
        dataGetter: (emp) => TimeRefactor(emp.checkIn!).toTimeString(),
      ),
      ExcelColumn<MonthAdminAttendance>(
        header: 'وقت الخروج',
        dataGetter: (emp) => TimeRefactor(emp.checkOut!).toTimeString(),
      ),
      ExcelColumn<MonthAdminAttendance>(
        header: 'عدد ساعات العمل',
        dataGetter:
            (emp) => TimeRefactor(
              emp.checkIn!,
            ).timeDifferenceInHoursAndMinutes(emp.checkOut!),
      ),
    ];
    await ExcelExportUtils.exportToExcel(
      data: employees,
      columns: columns,
      excelName: excelName,
      sheetName: 'Employees',
    );
  }
}
