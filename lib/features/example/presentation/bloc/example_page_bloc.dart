import 'package:awesome_app/core/base_bloc/base_bloc.dart';
import 'package:awesome_app/core/base_bloc/base_bloc_event.dart';
import 'package:awesome_app/core/base_bloc/base_bloc_state.dart';
import 'package:awesome_app/core/base_object.dart';
import 'package:awesome_app/core/network/base_response.dart';
import 'package:awesome_app/core/shared_pref/shared_pref_manager.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:awesome_app/features/example/domain/usecases/get_example.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'example_page_bloc.g.dart';

@CopyWith()
class ExampleBlocEvent extends BaseBlocEvent {
  ExampleBlocEvent({required int event}) : super(event: event);
}

@CopyWith()
class ExampleBlocState extends BaseBlocState {
  final List<Example>? example;

  ExampleBlocState({required int state, this.example, String? error})
      : super(state: state, error: error);

  @override
  List get props => [example, state, error];
}

class ExampleBloc extends BaseBloc<ExampleBlocEvent, ExampleBlocState> {
  final GetExample getExample;

  ExampleBloc({required this.getExample})
      : super(ExampleBlocState(state: BaseStateDef.INIT)) {
    //
    on<ExampleBlocEvent>((event, emit) async {
      switch (event.event) {
        case BaseEventDef.INIT:
          emit(state.copyWith(state: BaseStateDef.PROCESSING));
          emit(await _getExampleData());
          break;
        case BaseEventDef.LOAD_MORE:
          emit(state.copyWith(state: BaseStateDef.ON_LOAD_MORE));
          canLoadMore = false;
          emit(state.copyWith(state: BaseStateDef.SUCCESS));
          break;
        case BaseEventDef.REFRESH:
          emit(state.copyWith(state: BaseStateDef.ON_REFRESH));
          emit(await _getExampleData());
          break;
      }
    });
  }

  @override
  void onLoadMore() {
    super.onLoadMore();
    add(ExampleBlocEvent(event: BaseEventDef.LOAD_MORE));
  }

  @override
  void onRefresh() {
    super.onRefresh();
    add(ExampleBlocEvent(event: BaseEventDef.REFRESH));
  }

  Future<ExampleBlocState> _getExampleData() async {
    ApiResponse<List<Example>> response = await getExample.call(NoParam());

    if (response.success) {
      return state.copyWith(
          state: BaseStateDef.SUCCESS, example: response.data);
    } else {
      return state.copyWith(
          state: BaseStateDef.FAILED,
          example: null,
          error: response.getErrorMessage);
    }
  }
}
