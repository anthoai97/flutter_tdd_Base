import 'package:awesome_app/core/base_object.dart';
import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:awesome_app/features/example/domain/repostories/r_example.dart';
import 'package:awesome_app/features/example/domain/usecases/get_example.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_example_test.mocks.dart';

@GenerateMocks([ExampleRepository])
void main() {
  late GetExample usecase;
  late MockExampleRepository mockExampleRepository;

  setUp(() {
    mockExampleRepository = MockExampleRepository();
    usecase = GetExample(repository: mockExampleRepository);
  });

  final tData = [
    Example(avatar: '', id: 0, name: 'Test'),
    Example(avatar: '', id: 1, name: 'Test 2'),
  ];

  test('Should return a list of Example from repository', () async {
    // arrage
    when(mockExampleRepository.getUserExample())
        .thenAnswer((_) async => ApiResponse<List<Example>>(data: tData));

    // act
    final result = await usecase.call(NoParam());

    // assert
    expect(result.data, equals(tData));
    verify(mockExampleRepository.getUserExample());
    verifyNoMoreInteractions(mockExampleRepository);
  });
}
