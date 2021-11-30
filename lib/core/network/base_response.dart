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
    // Custom with your base API Object
    success = json['success'] ?? false;
    message = json['message'];
    statusCode = json['statusCode'];
    data = target != null ? target.fromJson(json['data']) : json['data'];
  }

  @override
  String toString() {
    return 'success: $success\nmessage: $message\nstatusCode: $statusCode\n data: $data';
  }

// TODO: Return error message if server return code
}
