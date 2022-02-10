import 'package:awesome_app/core/const.dart';
import 'package:awesome_app/core/shared_pref/shared_pref_manager.dart';

class SharedPreferenceHelper {
  //

  final SharedPrefManager _sharedPrefManager;

  SharedPreferenceHelper(this._sharedPrefManager);

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPrefManager.getData(PreferencesKey.auth_token);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPrefManager.setData(PreferencesKey.auth_token, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPrefManager.removeData(PreferencesKey.auth_token);
  }
}
