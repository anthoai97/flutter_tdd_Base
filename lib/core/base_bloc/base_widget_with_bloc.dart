import 'package:awesome_app/core/utils/log.dart';
import 'package:awesome_app/resources/R.dart';
import 'package:awesome_app/resources/styles.dart';
import 'package:awesome_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../screens/common/empty_view.dart';
import '../../screens/common/error_view.dart';
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
          return renderUIByState(context, state);
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

  Widget renderUIByState(BuildContext context, S state) {
    return defaultUIByState(context, state);
  }

  Widget defaultUIByState(BuildContext context, S state) {
    Widget body() {
      return renderUI(context, state);
    }

    if (BaseStateDef.PROCESSING == state.state) {
      Widget loading() {
        return renderProgressIndicator();
      }

      return Stack(children: <Widget>[
        body(),
        loading(),
      ]);
    } else if ((BaseStateDef.SUCCESS == state.state ||
            BaseStateDef.STARTED == state.state) &&
        bloc()!.isNoData()) {
      return renderEmptyViewByState(context, state);
    } else if (BaseStateDef.FAILED == state.state && bloc()!.isNoData()) {
      return renderErrorView(context, state);
    }

    return body();
  }

  @required
  Widget renderUI(BuildContext context, S state);

  Widget renderProgressIndicator() {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: double.infinity,
        ),
        child: Loading.screenLoadingSpinner(),
      ),
    );
  }

  Widget renderEmptyViewByState(BuildContext context, BaseBlocState state) {
    return renderEmptyView(context, state);
  }

  Widget renderEmptyView(BuildContext context, BaseBlocState state) {
    return EmptyView(
      onPressed: () => bloc()?.onRetry(),
    );
  }

  Widget renderErrorViewByState(BuildContext context, BaseBlocState state) {
    return null != bloc()!.blocError
        ? renderErrorView(context, state)
        : renderEmptyView(context, state);
  }

  Widget renderErrorView(BuildContext context, BaseBlocState state) {
    return ErrorView(
      error: bloc()!.blocError,
      onPressed: () => bloc()?.onRetry(),
    );
  }

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
    super.handleStateChangeListener(context, state);

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

abstract class PageState<
    W extends StatefulWidget,
    E extends BaseBlocEvent,
    S extends BaseBlocState,
    B extends BaseBloc<E, S>> extends ComponentState<W, E, S, B> {
  //
  AppBar renderAppbar(BuildContext context, S state) {
    return AppBar(
      title: Text(R.appName),
    );
  }

  @override
  Widget renderUIByState(BuildContext context, S state) {
    Widget widget = super.renderUIByState(context, state);

    return Scaffold(
      appBar: renderAppbar(context, state),
      body: widget,
    );
  }
}

abstract class PageRefreshState<
    W extends StatefulWidget,
    E extends BaseBlocEvent,
    S extends BaseBlocState,
    B extends BaseBloc<E, S>> extends ComponentRefreshState<W, E, S, B> {
  //

  @override
  bool get wantKeepAlive => true;

  AppBar renderAppbar(BuildContext context, S state) {
    return AppBar(
      title: Text(R.appName),
    );
  }

  @override
  Widget renderUIByState(BuildContext context, S state) {
    Widget widget = super.renderUIByState(context, state);

    return Scaffold(
      appBar: renderAppbar(context, state),
      body: widget,
    );
  }
}
