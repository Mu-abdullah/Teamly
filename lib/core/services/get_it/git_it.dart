import 'package:get_it/get_it.dart';

import '../../../features/admin/admin_attendance/data/repo/admin_attendance_repo.dart';
import '../../../features/admin/admin_attendance/data/repo/get_month_repo.dart';
import '../../../features/admin/custody/data/repo/add_custody.dart';
import '../../../features/admin/custody/data/repo/get_custody.dart';
import '../../../features/admin/custody_transaction/data/repo/add_custody_transaction_repo.dart';
import '../../../features/admin/custody_transaction/data/repo/emp_custody_transaction_repo.dart';
import '../../../features/admin/custody_transaction/data/repo/get_custody_transaction.dart';
import '../../../features/admin/custody_transaction/data/repo/satteled_repo.dart';
import '../../../features/admin/custody_transaction_items/data/repo/create_custody_trans_item_repo.dart';
import '../../../features/admin/custody_transaction_items/data/repo/get_custody_trans_item_repo.dart';
import '../../../features/admin/emp_profile/data/repo/user_profile_repo.dart';
import '../../../features/admin/home_screen/data/repo/emp_count_repo.dart';
import '../../../features/admin/home_screen/data/repo/home_emp_repo.dart';
import '../../../features/admin/home_screen/data/repo/vaction_count_repo.dart';
import '../../../features/admin/review_vacation_requests/data/repo/response_vacation_repo.dart';
import '../../../features/admin/review_vacation_requests/data/repo/review_vacation_repo.dart';
import '../../../features/auth/data/repo/auth_repo.dart';
import '../../../features/auth/data/repo/check_role_repo.dart';
import '../../../features/user/user_home/data/repo/attendance_repo.dart';
import '../../../features/user/user_home/data/repo/check_attendance_repo.dart';
import '../../../features/user/user_home/data/repo/check_user_custody_repo.dart';
import '../../../features/user/user_home/data/repo/emp_info_repo.dart';
import '../../../features/user/user_home/data/repo/get_history_repo.dart';
import '../../../features/user/user_home/data/repo/user_home_card_info_repo.dart';
import '../../../features/user/user_vaction/data/repo/get_user_vacations_requests_repo.dart'
    show GetUserVacationsRequestsRepo;
import '../../../features/user/user_vaction/data/repo/submit_vacation_request_repo.dart';
import '../../../features/user/user_vaction/data/repo/user_check_vacation_repo.dart';
import '../graph_ql/graph_ql.dart';
import '../supabase/auth_service/auth_services.dart';
import '../supabase/data_base_services.dart';
import '../supabase/supabase_services_repo.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  _registerRepositories();
  _registerServices();
}

void _registerRepositories() {
  locator.registerLazySingleton(() => AuthRepo(locator()));
  locator.registerLazySingleton(() => UserProfileRepo(locator()));
  locator.registerLazySingleton(() => CheckRoleRepo(locator()));
  locator.registerLazySingleton(() => GetCustodyRepo(locator()));
  locator.registerLazySingleton(() => GetCustodyTransactionRepo(locator()));
  locator.registerLazySingleton(() => AddCustodyRepo(locator()));
  locator.registerLazySingleton(() => EmpCountRepo(locator()));
  locator.registerLazySingleton(() => VactionCountRepo(locator()));
  locator.registerLazySingleton(() => HomeEmpRepo(locator()));
  locator.registerLazySingleton(() => AttendanceRepo(locator()));
  locator.registerLazySingleton(() => CheckAttendanceRepo(locator()));
  locator.registerLazySingleton(() => GetHistoryRepo(locator()));
  locator.registerLazySingleton(() => GetMonthRepo(locator()));
  locator.registerLazySingleton(() => AdminAttendanceRepository(locator()));
  locator.registerLazySingleton(() => EmpInfoRepo(locator()));
  locator.registerLazySingleton(() => UserHomeCardInfoRepo(locator()));
  locator.registerLazySingleton(() => SubmitVacationRequestRepo(locator()));
  locator.registerLazySingleton(() => GetUserVacationsRequestsRepo(locator()));
  locator.registerLazySingleton(() => ReviewVacationRepo(locator()));
  locator.registerLazySingleton(() => ResponseVacationRepo(locator()));
  locator.registerLazySingleton(() => UserCheckVacationRepo(locator()));
  locator.registerLazySingleton(() => AddCustodyTransactionRepo(locator()));
  locator.registerLazySingleton(() => EmpCustodyTransactionRepo(locator()));
  locator.registerLazySingleton(() => GetCustodyTransItemRepo(locator()));
  locator.registerLazySingleton(() => CreateCustodyTransItemRepo(locator()));
  locator.registerLazySingleton(() => SatteledRepo(locator()));
  locator.registerLazySingleton(() => ChechUserCustodyRepo(locator()));
}

void _registerServices() {
  locator.registerLazySingleton(() => GraphQLService());
  locator.registerLazySingleton(() => AuthServices());
  locator.registerLazySingleton(() => SupabaseServicesRepo());
  locator.registerLazySingleton<DataService>(
    () => SupabaseDataService(locator()),
  );
}
