import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../services/shared_pref/pref_keys.dart';
import '../../../services/shared_pref/shared_pref.dart';

class AppUserRepo {
  // get user data from shared preferences
  void logout() async {
    await SharedPref.removeData(key: PrefKeys.emp);
    await SharedPref.removeData(key: PrefKeys.userID);
    await SharedPref.removeData(key: PrefKeys.role);
    await Supabase.instance.client.auth.signOut();
  }
}
