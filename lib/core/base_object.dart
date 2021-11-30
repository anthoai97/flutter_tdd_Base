import 'package:equatable/equatable.dart';

abstract class BaseObject<T> extends Equatable {
  T fromJson(json);
}