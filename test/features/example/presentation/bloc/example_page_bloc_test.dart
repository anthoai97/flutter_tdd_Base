import 'package:awesome_app/core/base_bloc/base_bloc_event.dart';
import 'package:awesome_app/core/base_bloc/base_bloc_state.dart';
import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:awesome_app/features/example/domain/usecases/get_example.dart';
import 'package:awesome_app/features/example/presentation/bloc/example_page_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'example_page_bloc_test.mocks.dart';

@GenerateMocks([GetExample])
void main() {
  late MockGetExample mockGetExample;
  late ExampleBloc bloc;

  setUp(() {
    mockGetExample = MockGetExample();

    bloc = ExampleBloc(getExample: mockGetExample);
  });

  List<Example> tData = [
    Example(avatar: '', id: '0', name: 'Test'),
    Example(avatar: '', id: '1', name: 'Test 2'),
  ];

  test("Initial should be ExampleBlocState and state = InitState = 0", () {
    // assert
    expect(bloc.state, isA<ExampleBlocState>());
    expect(bloc.state.state, equals(BaseStateDef.INIT));
  });

  group("Get example usecase", () {
    test("Should get data from the get example usecase", () async {
      // arrange
      when(mockGetExample.call(any))
          .thenAnswer((_) async => ApiResponse(data: tData));

      // act
      bloc.add(ExampleBlocEvent(event: BaseEventDef.INIT));
      await untilCalled(mockGetExample(any));

      // assert
      verify(mockGetExample.call(any));
    });

    blocTest<ExampleBloc, ExampleBlocState>(
      "Should emits [PROCESSING, SUCCESS] when call INIT Event success",
      build: () {
        when(mockGetExample.call(any))
            .thenAnswer((_) async => ApiResponse(data: tData, success: true));
        return bloc;
      },
      act: (bloc) => bloc.add(ExampleBlocEvent(event: BaseEventDef.INIT)),
      expect: () => <ExampleBlocState>[
        ExampleBlocState(state: BaseStateDef.PROCESSING),
        ExampleBlocState(state: BaseStateDef.SUCCESS, example: tData)
      ],
    );

    blocTest<ExampleBloc, ExampleBlocState>(
      "Should emits [PROCESSING, FAILED] when call INIT Event failed",
      build: () {
        when(mockGetExample.call(any)).thenAnswer((_) async => ApiResponse(
            data: null, success: false, message: "Test error message"));
        return bloc;
      },
      act: (bloc) => bloc.add(ExampleBlocEvent(event: BaseEventDef.INIT)),
      expect: () => <ExampleBlocState>[
        ExampleBlocState(state: BaseStateDef.PROCESSING),
        ExampleBlocState(
            state: BaseStateDef.FAILED, error: "Test error message")
      ],
    );

    blocTest<ExampleBloc, ExampleBlocState>(
      "Should emits [ON_REFRESH, SUCCESS] when call Refrest Event Success",
      build: () {
        when(mockGetExample.call(any))
            .thenAnswer((_) async => ApiResponse(data: tData, success: true));
        return bloc;
      },
      act: (bloc) => bloc.add(ExampleBlocEvent(event: BaseEventDef.REFRESH)),
      expect: () => <ExampleBlocState>[
        ExampleBlocState(state: BaseStateDef.ON_REFRESH),
        ExampleBlocState(state: BaseStateDef.SUCCESS, example: tData)
      ],
      verify: (bloc) {
        expect(bloc.canLoadMore, isTrue);
      },
    );
  });
}
