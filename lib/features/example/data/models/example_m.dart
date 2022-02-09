import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example_m.g.dart';

@JsonSerializable(explicitToJson: true)
class ExampleModel extends Example {
  ExampleModel({String? createdAt, String? name, String? avatar, String? id})
      : super(avatar: avatar, name: name, createdAt: createdAt, id: id);

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleModelToJson(this);

  @override
  ExampleModel fromJson(json) {
    return ExampleModel.fromJson(json);
  }

  @override
  List get props => [id, name, avatar, createdAt];
}
