import 'package:awesome_app/resources/R.dart';
import 'package:awesome_app/resources/styles.dart';
import 'package:awesome_app/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  ErrorView(
      {Key? key,
      this.text,
      this.color,
      this.constraints,
      this.error,
      this.icon,
      this.padding,
      this.onPressed})
      : super(key: key);

  final GestureTapCallback? onPressed;
  final Widget? icon;
  final Widget? text;
  final String? error;
  final EdgeInsets? padding;
  final Color? color;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      constraints: constraints,
      padding: padding ?? EdgeInsets.all(PaddingDef.padding_10),
      alignment: Alignment.center,
      child: SafeArea(
        child: GestureDetector(
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon ??
                  ImgView.asset(R.images.imageError,
                      width: R.screenUtil.screenWidth * 0.5),
              text ??
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        error ?? R.strings.commonErrorText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
