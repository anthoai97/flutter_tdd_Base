import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_bloc.dart';
import 'base_bloc_event.dart';
import 'base_bloc_state.dart';

/// Higher-Order Components
abstract class ComponentState<W extends StatefulWidget, E extends BaseBlocEvent,
        S extends BaseBlocState, B extends BaseBloc<E, S>> extends State<W>
    with AutomaticKeepAliveClientMixin {
//

  B? _bloc;

  @override
  void initState() {
    super.initState();
    initBloc(context);
  }

  @required
  B provideBloc(BuildContext context);

  B? bloc({
    BuildContext? cxt,
    bool warning = false,
  }) {
    try {
      return _bloc ?? BaseBloc.of<B>(cxt ?? context);
    } catch (e) {
      if (warning) {
        print('ComponentProviderError ==> $e');
      }
    }
    return null;
  }

  void initBloc(BuildContext context) {
    _bloc = provideBloc(context);
  }

  Widget buildWidget() {
    return BlocProvider<B>.value(
      value: _bloc!,
      child: renderWidgetWithBlocListener(),
    );
  }

  Widget renderWidgetWithBlocListener() {
    return BlocListener<B, S>(
      listenWhen: (S previous, S current) =>
          handleBlocListenerCondition(previous, current),
      listener: (BuildContext context, S state) =>
          handleStateChangeListener(context, state),
      child: BlocBuilder<B, S>(
        builder: (BuildContext context, S state) {
          return renderUI(context, state);
        },
      ),
    );
  }

  bool handleBlocListenerCondition(S previous, S current) {
    return previous != current && previous.state != current.state;
  }

  @protected
  void handleStateChangeListener(BuildContext context, S state) {
    // Catch Base Error widget here
  }

  @required
  Widget renderUI(BuildContext context, S state);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (!mounted) return Container();
    return buildWidget();
  }

  @override
  bool get wantKeepAlive => false;

//
}

abstract class ComponentRefreshState<
    W extends StatefulWidget,
    E extends BaseBlocEvent,
    S extends BaseBlocState,
    B extends BaseBloc<E, S>> extends ComponentState<W, E, S, B> {
  //

  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  void handleStateChangeListener(BuildContext context, S state) {
    switch (state.state) {
      case BaseStateDef.FAILED:
        if (refreshController.isRefresh) {
          refreshController.refreshFailed();
        } else {
          refreshController.loadFailed();
        }
        break;
      case BaseStateDef.SUCCESS:
        if (refreshController.isRefresh) {
          refreshController.refreshCompleted();
        } else {
          refreshController.loadComplete();
        }
        break;
      default:
        break;
    }
  }

  @override
  bool get wantKeepAlive => true;
//
}
