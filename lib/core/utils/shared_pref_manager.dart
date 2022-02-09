import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  final SharedPreferences sharedPreferences;

  SharedPrefManager({required this.sharedPreferences});

  /*
    + Private functions
  */

  bool _hasValidKeyLength(String key) {
    return (key.length == 0) ? false : true;
  }

  bool _isSuitableGetKey(String key) {
    return (!_hasValidKeyLength(key) || !sharedPreferences.containsKey(key))
        ? false
        : true;
  }

  /*
    + Other Functions
  */
  bool containsKey(String key) {
    if (!_hasValidKeyLength(key)) return false;
    return sharedPreferences.containsKey(key) ? true : false;
  }

  void removeAllData() {
    sharedPreferences.clear();
  }

  /*
    + Set & get data with common variable types
  */
  void setData(String key, dynamic data) {
    if (!_hasValidKeyLength(key)) return;
    if (data is int) {
      sharedPreferences.setInt(key, data);
    } else if (data is bool) {
      sharedPreferences.setBool(key, data);
    } else if (data is double) {
      sharedPreferences.setDouble(key, data);
    } else if (data is String) {
      sharedPreferences.setString(key, data);
    } else if (data is List<String>) {
      sharedPreferences.setStringList(key, data);
    } else {
      throw new UnsupportedError(
          'The specified data type for setting is invalid.');
    }
  }

  dynamic getData<T>(String key) {
    if (!_isSuitableGetKey(key)) return null;
    if (T.toString().compareTo("int") == 0) {
      return sharedPreferences.getInt(key);
    } else if (T.toString().compareTo("bool") == 0) {
      return sharedPreferences.getBool(key);
    } else if (T.toString().compareTo("double") == 0) {
      return sharedPreferences.getDouble(key);
    } else if (T.toString().compareTo("String") == 0) {
      return sharedPreferences.getString(key);
    } else if (T.toString().compareTo("List<String>") == 0) {
      return sharedPreferences.getStringList(key);
    } else {
      throw new UnsupportedError(
        'The specified data type for getting is invalid',
      );
    }
  }

  /*
    + Remove an entry from sharedpref
  */
  void removeData(String key) {
    if (!_isSuitableGetKey(key)) return;
    sharedPreferences.remove(key);
  }

  /*
    + Set & get data with other variable types
  */
  void setMapData(String key, Map data) {
    if (!_hasValidKeyLength(key)) return;
    String obj = json.encode(data);
    sharedPreferences.setString(key, obj);
  }

  Future<void> setMapSync(String key, Map data) async {
    if (!_hasValidKeyLength(key)) return;
    String obj = json.encode(data);
    await sharedPreferences.setString(key, obj);
  }

  Map? getMapData(String key) {
    if (!_isSuitableGetKey(key)) return null;
    String data = sharedPreferences.getString(key)!;
    return json.decode(data);
  }
}
