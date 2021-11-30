import 'package:flutter/material.dart';

enum Slide { ToLeft, ToTop, ToRight, ToBottom }

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Slide slideTo;

  /*
    + slideTo has one of these values: left, top, right, bottom
    + Reference: https://medium.com/flutter-community/everything-you-need-to-know-about-flutter-page-route-transition-9ef5c1b32823
  */

  SlidePageRoute({
    required this.page,
    this.slideTo = Slide.ToLeft,
  }) : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin;
              var end = Offset.zero;

              switch (slideTo) {
                case Slide.ToLeft:
                  begin = Offset(1.0, 0.0);
                  break;
                case Slide.ToTop:
                  begin = Offset(0.0, 1.0);
                  break;
                case Slide.ToRight:
                  begin = Offset(-1.0, 0.0);
                  break;
                case Slide.ToBottom:
                  begin = Offset(0.0, -1.0);
                  break;
              }

              return SlideTransition(
                position: Tween<Offset>(
                  begin: begin,
                  end: end,
                ).animate(animation),
                child: child,
              );
            });
}
