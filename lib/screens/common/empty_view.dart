import 'dart:ui';

import 'package:awesome_app/resources/R.dart';
import 'package:awesome_app/widgets/image_widget.dart';
import 'package:flutter/material.dart';

import '../../resources/styles.dart';

class EmptyView extends StatelessWidget {
  EmptyView(
      {Key? key,
      this.color,
      this.constraints,
      this.text,
      this.message,
      this.icon,
      this.padding,
      this.onPressed})
      : super(key: key);

  final GestureTapCallback? onPressed;
  final Widget? icon;
  final Widget? text;
  final String? message;
  final EdgeInsets? padding;
  final Color? color;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      alignment: Alignment.center,
      padding: padding ?? EdgeInsets.all(PaddingDef.padding_10),
      color: color,
      child: SafeArea(
        child: GestureDetector(
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon ??
                  ImgView.asset(R.images.imageNoResult,
                      width: R.screenUtil.screenWidth * 0.5),
              text ??
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        message ?? R.strings.noDataToShowText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
