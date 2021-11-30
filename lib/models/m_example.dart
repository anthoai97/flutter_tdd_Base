import 'package:awesome_app/core/base_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'm_example.g.dart';

@JsonSerializable(explicitToJson: true)
class ExampleModel extends BaseObject<ExampleModel> {
  final String? createdAt;
  final String? name;
  final String? avatar;
  final String? id;

  ExampleModel({this.createdAt, this.name, this.avatar, this.id});

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleModelToJson(this);

  @override
  fromJson(json) {
    return ExampleModel.fromJson(json);
  }

  @override
  List get props => [id, name, avatar, createdAt];
}
