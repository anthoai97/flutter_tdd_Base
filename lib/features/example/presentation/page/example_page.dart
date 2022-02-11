import 'package:awesome_app/core/base_bloc/base_bloc_event.dart';
import 'package:awesome_app/core/base_bloc/base_bloc_state.dart';
import 'package:awesome_app/core/base_bloc/base_widget_with_bloc.dart';
import 'package:awesome_app/di/dependency_injection.dart';
import 'package:awesome_app/features/example/domain/entities/example.dart';
import 'package:awesome_app/features/example/presentation/bloc/example_page_bloc.dart';
import 'package:awesome_app/widgets/custom_smart_refresh.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  ExampleScreenState createState() => ExampleScreenState();
}

class ExampleScreenState extends ComponentRefreshState<ExampleScreen,
    ExampleBlocEvent, ExampleBlocState, ExampleBloc> {
  @override
  provideBloc(BuildContext context) {
    return sl<ExampleBloc>()..add(ExampleBlocEvent(event: BaseEventDef.INIT));
  }

  @override
  Widget renderUI(BuildContext context, state) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(state),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(title: Text('Example app bar'));

  Widget _buildBody(ExampleBlocState state) {
    Widget _body = Container();
    switch (state.state) {
      case BaseStateDef.PROCESSING:
        _body = Center(
            child: SizedBox(
          width: 50,
          height: 50,
          child: LoadingIndicator(
            indicatorType: Indicator.circleStrokeSpin,
            strokeWidth: 2,
          ),
        ));
        break;
      case BaseStateDef.SUCCESS:
      case BaseStateDef.ON_REFRESH:
      case BaseStateDef.ON_LOAD_MORE:
        var example = state.example;
        _body = CustomSmartRefresh(
          controller: refreshController,
          enablePullUp: bloc()!.canLoadMore,
          onRefresh: (cont) {
            bloc()?.onRefresh();
          },
          onLoading: (cont) {
            bloc()?.onLoadMore();
          },
          child: _buildExampleList(example!),
        );

        break;
    }

    return _body;
  }

  Widget _buildExampleList(List<Example> examples) {
    return ListView.builder(
      itemBuilder: (_, index) {
        var example = examples[index];
        return Container(
          height: 40,
          child: Text(
            example.name!,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        );
      },
      itemCount: examples.length,
    );
  }
}
