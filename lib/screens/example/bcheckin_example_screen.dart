import 'package:awesome_app/core/base_bloc/base_bloc_event.dart';
import 'package:awesome_app/core/base_bloc/base_bloc_state.dart';
import 'package:awesome_app/core/base_bloc/base_widget_with_bloc.dart';
import 'package:awesome_app/models/m_example.dart';
import 'package:awesome_app/resources/styles.dart';
import 'package:awesome_app/widgets/custom_smart_refresh.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'bloc/example_screen_bloc.dart';

class BCheckInExampleScreen extends StatefulWidget {
  const BCheckInExampleScreen({Key? key}) : super(key: key);

  @override
  _BCheckInExampleScreenState createState() => _BCheckInExampleScreenState();
}

class _BCheckInExampleScreenState extends ComponentRefreshState<
    BCheckInExampleScreen, UserBlocEvent, UserBlocState, UserBloc> {
  @override
  provideBloc(BuildContext context) {
    return UserBloc()..add(UserBlocEvent(event: BaseEventDef.INIT));
  }

  @override
  Widget renderUI(BuildContext context, state) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(state),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(title: Text('Example app bar'));

  Widget _buildBody(UserBlocState state) {
    Widget _body = Container();
    switch (state.state) {
      case BaseStateDef.PROCESSING:
        _body =
            Center(child: LoadingIndicator(indicatorType: Indicator.lineScale));
        break;
      case BaseStateDef.SUCCESS:
      case BaseStateDef.ON_REFRESH:
      case BaseStateDef.ON_LOAD_MORE:
        var users = state.user;
        _body = CustomSmartRefresh(
          controller: refreshController,
          enablePullUp: bloc()!.canLoadMore,
          onRefresh: (cont) {
            bloc()?.onRefresh();
          },
          onLoading: (cont) {
            bloc()?.onLoadMore();
          },
          child: _buildUserList(users!),
        );
        break;
    }

    return _body;
  }

  Widget _buildUserList(List<ExampleModel> users) {
    return ListView.builder(
      itemBuilder: (_, index) {
        var user = users[index];
        return Container(
          height: 40,
          child: Text(
            user.name!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
