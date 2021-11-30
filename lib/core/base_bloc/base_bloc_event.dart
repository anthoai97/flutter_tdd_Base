import 'package:equatable/equatable.dart';

abstract class BaseEventDef {
  static const int INIT = 0;
  static const int REFRESH = 1;
  static const int LOAD_MORE = 2;
  static const int UPDATE = 3;
  static const int UPDATED = 4;
  static const int DELETE = 4;
  static const int DELETED = 5;
  static const int SUBMIT = 6;
  static const int SUBMITTED = 7;
  static const int SHOW_LOADING = 8;
  static const int END = SHOW_LOADING + 1;
}

abstract class BaseBlocEvent extends Equatable {
  final int event;

  const BaseBlocEvent({this.event = BaseEventDef.INIT});

  @override
  List<Object> get props => <Object>[event];

  @override
  bool get stringify => true;
}
