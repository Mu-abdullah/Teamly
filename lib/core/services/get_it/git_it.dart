import 'package:get_it/get_it.dart';

import '../../../features/admin/custody/data/repo/get_custody.dart';
import '../../../features/admin/custody_transaction/data/repo/get_custody_transaction.dart';
import '../graph_ql/graph_ql.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  _registerRepositories();
  _registerServices();
}

void _registerRepositories() {
  locator.registerLazySingleton(() => GetCustodyRepo(locator()));
  locator.registerLazySingleton(() => GetCustodyTransactionRepo(locator()));
}

void _registerServices() {
  locator.registerLazySingleton(() => GraphQLService());
}
