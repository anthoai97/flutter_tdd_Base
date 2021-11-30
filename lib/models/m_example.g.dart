// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleModel _$ExampleModelFromJson(Map<String, dynamic> json) => ExampleModel(
      createdAt: json['createdAt'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExampleModelToJson(ExampleModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'name': instance.name,
      'avatar': instance.avatar,
      'id': instance.id,
    };
