import 'dart:ui';

import 'package:awesome_app/resources/styles.dart';
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double? height, width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final bool blurEffect;
  final AlignmentGeometry? alignment;

  final BorderRadius? borderRadius;

  BlurContainer({
    Key? key,
    required this.child,
    this.blur = 10,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.color = Colors.white70,
    this.borderRadius,
    this.alignment,
    this.blurEffect = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget children() {
      return Container(
        height: height,
        width: width,
        alignment: alignment,
        padding: padding ?? EdgeInsets.zero,
        margin: margin ?? EdgeInsets.zero,
        color: color == Colors.transparent ? color : color.withOpacity(0.5),
        child: child,
      );
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: blurEffect
          ? BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: children(),
            )
          : children(),
    );
  }
}

class BlurBorderContainer extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget child;
  final double blur;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final BoxBorder? border;
  final Decoration? decoration;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;

  final bool blurEffect;
  final BorderRadius? borderRadius;

  BlurBorderContainer({
    Key? key,
    required this.child,
    this.blur = 10,
    this.decoration,
    this.border,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.color = Colors.white70,
    this.borderRadius,
    this.constraints,
    this.alignment,
    this.blurEffect = true,
  }) : super(key: key);

  @override
  Size get preferredSize {
    if (child is PreferredSize) {
      return (child as PreferredSize).preferredSize;
    }
    return Size.fromHeight(height ?? 65);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      constraints: constraints,
      decoration: decoration ??
          BoxDecoration(
            border: border ??
                Border(
                  top: BorderSide(
                    color: ColorsDef.color_555555,
                    width: 0.1,
                  ),
                ),
          ),
      child: BlurContainer(
        blur: blur,
        child: child,
        padding: padding,
        color: color,
        alignment: alignment,
        borderRadius: borderRadius,
        blurEffect: blurEffect,
      ),
    );
  }
}
