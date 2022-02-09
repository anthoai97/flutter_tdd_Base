import 'package:awesome_app/core/base_object.dart';

class Example extends BaseObject {
  final String? createdAt;
  final String? name;
  final String? avatar;
  final String? id;

  Example({this.createdAt, this.name, this.avatar, this.id});

  @override
  List<Object?> get props => [createdAt, name, avatar, id];

  @override
  fromJson(json) {}
}
