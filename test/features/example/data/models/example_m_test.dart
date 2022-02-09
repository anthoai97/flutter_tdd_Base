import 'package:awesome_app/features/example/data/models/example_m.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tExampleModel = ExampleModel(createdAt: '1111', id: '0', name: 'test');

  test('Should be a subclass of Example entity', () {
    expect(tExampleModel, isA<Example>());
  });

  group('FromJson', () {
    test('Should return a valid model when the use JSON data', () async {
      // arrange
      final Map<String, dynamic> jsonMap = tExampleModel.toJson();

      // act
      final result = ExampleModel.fromJson(jsonMap);

      // assert
      expect(result, equals(tExampleModel));
    });

    test('Should return Json map containing the proper data', () async {
      // act
      final result = tExampleModel.toJson();

      // assert
      final validMatcher = {
        "id": 0,
        "name": "test",
        "createdAt": '1111',
        'avatar': null
      };

      expect(result, equals(validMatcher));
    });
  });
}
