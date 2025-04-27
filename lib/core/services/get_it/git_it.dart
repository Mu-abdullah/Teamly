import 'package:get_it/get_it.dart';

import '../../../features/admin/custody/data/repo/add_custody.dart';
import '../../../features/admin/custody/data/repo/get_custody.dart';
import '../../../features/admin/custody_transaction/data/repo/get_custody_transaction.dart';
import '../../../features/admin/emp_profile/data/repo/user_profile_repo.dart';
import '../../../features/admin/home_screen/data/repo/emp_count_repo.dart';
import '../../../features/admin/home_screen/data/repo/home_emp_repo.dart';
import '../../../features/auth/data/repo/auth_repo.dart';
import '../../../features/auth/data/repo/check_role_repo.dart';
import '../../../features/user/user_home/data/repo/attendance_repo.dart';
import '../../../features/user/user_home/data/repo/check_attendance_repo.dart';
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
  locator.registerLazySingleton(() => HomeEmpRepo(locator()));
  locator.registerLazySingleton(() => AttendanceRepo(locator()));
  locator.registerLazySingleton(() => CheckAttendanceRepo(locator()));
}

void _registerServices() {
  locator.registerLazySingleton(() => GraphQLService());
  locator.registerLazySingleton(() => AuthServices());
  locator.registerLazySingleton(() => SupabaseServicesRepo());
  locator.registerLazySingleton<DataService>(
    () => SupabaseDataService(locator()),
  );
}
