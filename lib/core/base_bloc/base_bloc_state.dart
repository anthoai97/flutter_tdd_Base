import 'package:equatable/equatable.dart';

abstract class BaseStateDef {
  static const int INIT = 0;
  static const int STARTED = 1;
  static const int PROCESSING = 2;
  static const int ON_REFRESH = 3;
  static const int ON_LOAD_MORE = 4;
  static const int LOADING = 5;
  static const int SUCCESS = 6;
  static const int FAILED = 7;
}

abstract class BaseBlocState extends Equatable {
  final int state;
  final String? error; // Send error for UI

  BaseBlocState({required this.state, this.error});

  @override
  List get props => [state, error];

  bool get isEndStatus =>
      state == BaseStateDef.SUCCESS || state == BaseStateDef.FAILED;
}
