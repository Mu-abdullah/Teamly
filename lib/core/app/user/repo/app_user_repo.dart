import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../services/shared_pref/pref_keys.dart';
import '../../../services/shared_pref/shared_pref.dart';

class AppUserRepo {
  void logout() async {
    await SharedPref.removeData(key: PrefKeys.emp);
    await SharedPref.removeData(key: PrefKeys.empID);
    await SharedPref.removeData(key: PrefKeys.userId);
    await SharedPref.removeData(key: PrefKeys.role);
    await SharedPref.removeData(key: PrefKeys.companyID);
    await SharedPref.removeData(key: PrefKeys.remember);

    await Supabase.instance.client.auth.signOut();
  }
}
