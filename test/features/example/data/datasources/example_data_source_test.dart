import 'package:awesome_app/core/network/api_service.dart';
import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/features/example/data/datasources/example_data_source.dart';
import 'package:awesome_app/features/example/data/models/example_m.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'example_data_source_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late ExampleRemoteDataSourceImpl exampleRemoteDataSourceImpl;
  late MockApiService mockApiService;

  List<ExampleModel> tData = [
    ExampleModel(avatar: '', id: '0', name: 'Test'),
    ExampleModel(avatar: '', id: "1", name: 'Test 2'),
  ];

  setUp(() {
    mockApiService = MockApiService();
    exampleRemoteDataSourceImpl =
        ExampleRemoteDataSourceImpl(apiService: mockApiService);
  });

  group("Get example", () {
    test('Should return list example', () async {
      // arange
      when(mockApiService.get<List<ExampleModel>, ExampleModel>(any,
              baseObject: anyNamed('baseObject')))
          .thenAnswer((_) async => ApiResponse(data: tData));

      // act
      final result = await exampleRemoteDataSourceImpl.getExample();

      // assert
      expect(result.data, equals(tData));
      verify(mockApiService.get(any, baseObject: anyNamed('baseObject')))
          .called(1);
    });
  });
}
