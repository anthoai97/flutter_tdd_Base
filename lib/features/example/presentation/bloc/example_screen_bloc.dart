import 'package:awesome_app/core/base_bloc/base_bloc.dart';
import 'package:awesome_app/core/base_bloc/base_bloc_event.dart';
import 'package:awesome_app/core/base_bloc/base_bloc_state.dart';
import 'package:awesome_app/features/example/data/models/m_example.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'example_screen_bloc.g.dart';

@CopyWith()
class UserBlocEvent extends BaseBlocEvent {
  UserBlocEvent({required int event}) : super(event: event);
}

@CopyWith()
class UserBlocState extends BaseBlocState {
  final List<ExampleModel>? user;

  UserBlocState({required int state, this.user}) : super(state: state);

  @override
  List get props => [user, state];
}

class UserBloc extends BaseBloc<UserBlocEvent, UserBlocState> {
  UserBloc() : super(UserBlocState(state: BaseStateDef.INIT)) {
    on<UserBlocEvent>((event, emit) async {
      switch (event.event) {
        case BaseEventDef.INIT:
          emit(state.copyWith(state: BaseStateDef.PROCESSING));
          // emit(await _getExampleData());
          break;
        case BaseEventDef.LOAD_MORE:
          emit(state.copyWith(state: BaseStateDef.ON_LOAD_MORE));
          canLoadMore = false;
          emit(state.copyWith(state: BaseStateDef.SUCCESS));
          break;
        case BaseEventDef.REFRESH:
          emit(state.copyWith(state: BaseStateDef.ON_REFRESH));
          // emit(await _getExampleData());
          break;
      }
    });
  }

  @override
  void onLoadMore() {
    super.onLoadMore();
    add(UserBlocEvent(event: BaseEventDef.LOAD_MORE));
  }

  @override
  void onRefresh() {
    super.onRefresh();
    add(UserBlocEvent(event: BaseEventDef.REFRESH));
  }

  // Future<UserBlocState> _getExampleData() async {
  //   List<ExampleModel>? _models = await RExample.getExampleModels();

  //   if (_models != null) {
  //     return state.copyWith(state: BaseStateDef.SUCCESS, user: _models);
  //   } else {
  //     return state.copyWith(state: BaseStateDef.FAILED, user: null);
  //   }
  // }
}
