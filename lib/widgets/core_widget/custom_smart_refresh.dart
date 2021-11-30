import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomSmartRefresh extends StatefulWidget {
  final Function(RefreshController)? onRefresh;
  final Function(RefreshController)? onLoading;
  final Widget child;
  final RefreshController? controller;
  final bool enablePullUp;

  CustomSmartRefresh({
    Key? key,
    this.onRefresh,
    this.onLoading,
    required this.child,
    this.controller,
    this.enablePullUp = false,
  }) : super(key: key);

  @override
  _CustomSmartRefreshState createState() => _CustomSmartRefreshState();
}

class _CustomSmartRefreshState extends State<CustomSmartRefresh> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = widget.controller ?? RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: widget.enablePullUp,
      controller: _refreshController,
      physics: BouncingScrollPhysics(),
      header: MaterialClassicHeader(

          /// SET Custom background
          ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget? body;
          if (mode == LoadStatus.loading) {
            body = LoadingIndicator(
              indicatorType: Indicator.ballZigZag,
            );
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed! Click retry");
          } else if (mode == LoadStatus.canLoading) {
            body = LoadingIndicator(
              indicatorType: Indicator.ballZigZag,
            );
          }
          if (body == null) return Container();
          return Container(
            height: 40.0,
            child: Center(child: body),
          );
        },
      ),
      onRefresh: () => widget.onRefresh != null
          ? widget.onRefresh!(_refreshController)
          : null,
      onLoading: () => widget.onLoading != null
          ? widget.onLoading!(_refreshController)
          : null,
      child: widget.child,
    );
  }
}
