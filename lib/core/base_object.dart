import 'package:awesome_app/core/network/base_response.dart';
import 'package:equatable/equatable.dart';

abstract class BaseObject extends Equatable {
  fromJson(json);
}

abstract class Usecase<Type, Params> {
  Future<ApiResponse<Type>> call(Params params);
}

class NoParam {}
