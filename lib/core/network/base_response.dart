import 'package:awesome_app/core/base_object.dart';

class ApiResponse<T> {
  bool success;
  String? statusCode;
  String? message;
  T? data;

  ApiResponse({
    this.success = false,
    this.message,
    this.data,
    this.statusCode,
  });

  ApiResponse<T> parseJson<K>(json, BaseObject<K>? target) {
    success = true;
    message = "Error happen";
    statusCode = "OK";
    if (target != null) {
      data = (json is List
          ? json.map<K>((e) => target.fromJson(e)).toList()
          : target.fromJson(json)) as T?;
    } else {
      data = json;
    }
    return this;
  }

  // ApiResponse<T> parseJson<K>(json, BaseObject? target) {
  //   // Custom with your base API Object
  //   statusCode = json['code'];
  //   success = (statusCode != null && statusCode == 'SUCCESS');
  //   final _dataJson = json['data'];

  //   if (target != null && _dataJson != null) {
  //     try {
  //       data = (_dataJson is List
  //           ? _dataJson.map<K>((e) => target.fromJson(e)).toList()
  //           : target.fromJson(_dataJson)) as T;
  //     } catch (e) {
  //       data = null;
  //     }
  //   } else {
  //     data = _dataJson;
  //   }

  //   return this;
  // }

  @override
  String toString() {
    return 'success: $success\nmessage: $message\nstatusCode: $statusCode\n data: $data';
  }

  String getErrorMessage() {
    return 'Error occurst';
  }
}
