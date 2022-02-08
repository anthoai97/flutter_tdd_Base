import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:json_annotation/json_annotation.dart';

part 'm_example.g.dart';

@JsonSerializable(explicitToJson: true)
class ExampleModel extends Example {
  ExampleModel({String? createdAt, String? name, String? avatar, int? id})
      : super(avatar: avatar, name: name, createdAt: createdAt, id: id);

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
