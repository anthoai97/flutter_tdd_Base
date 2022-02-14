import 'package:awesome_app/core/route/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_bloc_event.dart';
import 'base_bloc_state.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends Bloc<E, S> {
//
  int startPage = 0;
  int pageSize = 20;
  int page = 0;
  bool canLoadMore = true;
  String? blocError;

  BaseBloc(
    S initialState, {
    this.pageSize = 20,
    this.startPage = 0,
    this.page = 0,
  }) : super(initialState);

  @mustCallSuper
  void onRefresh() {
    resetBloc();
    // fireEventToRefresh
  }

  @mustCallSuper
  void onRetry() {
    resetBloc();
    // fireEventToRetry
  }

  void onLoadMore() {
    // fireEventToLoadMore
    if (canLoadMore) page++;
  }

  void resetBloc() {
    page = startPage;
    canLoadMore = true;
    clearBlocError();
  }

  void clearBlocError() => blocError = null;

  bool isNoData();

  void dispose() {
    // dispose
  }

  static B? of<B extends BaseBloc>(
    BuildContext? context, {
    bool warning = true,
  }) {
    try {
      return BlocProvider.of<B>(
          context ?? NavigationManager().rootNavigator.currentContext!);
    } catch (e) {
      if (warning) {
        print('BaseBlocProviderError ==> $e');
      }
    }
    return null;
  }

//
}
