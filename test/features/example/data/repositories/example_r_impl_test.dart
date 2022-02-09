import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/features/example/data/datasources/example_data_source.dart';
import 'package:awesome_app/features/example/data/repositories/example_r_impl.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'example_r_impl_test.mocks.dart';

@GenerateMocks([ExampleRemoteDataSource])
void main() {
  late ExampleRepositoryImpl repositoryImpl;
  late MockExampleRemoteDataSource mockExampleRemoteDataSource;

  final tData = [
    Example(avatar: '', id: '0', name: 'Test'),
    Example(avatar: '', id: "1", name: 'Test 2'),
  ];

  setUp(() {
    mockExampleRemoteDataSource = MockExampleRemoteDataSource();
    repositoryImpl =
        ExampleRepositoryImpl(remoteDataSource: mockExampleRemoteDataSource);
  });

  test('Get example should return list of user example', () async {
    // arrage
    when(mockExampleRemoteDataSource.getExample())
        .thenAnswer((_) async => ApiResponse(data: tData));

    // act
    final result = await repositoryImpl.getUserExample();

    // assert
    verify(mockExampleRemoteDataSource.getExample()).called(1);
    expect(result.data, equals(tData));
  });
}
