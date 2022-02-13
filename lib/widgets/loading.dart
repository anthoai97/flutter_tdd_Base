import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../core/utils/log.dart';
import '../resources/R.dart';
import '../resources/styles.dart';
import 'blur_container/blur_container.dart';

class Loading {
  //

  static Widget screenLoadingSpinner({bool showBorder = false}) {
    Widget child() {
      try {
        if (showBorder) {
          return BlurBorderContainer(
            constraints: BoxConstraints(maxWidth: 75, maxHeight: 75),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: ColorsDef.color_E7E9EC),
              borderRadius: BorderRadius.circular(10),
            ),
            borderRadius: BorderRadius.circular(10),
            child: componentLoadingSpinner(),
          );
        } else {
          return componentLoadingSpinner();
        }
      } catch (e) {
        Log.error('screenLoadingSpinner', error: e);
        return spinKitWaveLoading();
      }
    }

    return Center(
      child: child(),
    );
  }

  static Widget componentLoadingSpinner({double? height, double? width}) {
    try {
      return Container(
        width: width,
        height: height,
        child: Image.asset(R.images.imageLoadingBlack, fit: BoxFit.cover),
      );
    } catch (e) {
      Log.error('componentLoadingSpinner', error: e);
      return spinKitCircleLoading();
    }
  }

  static Widget spinKitCircleLoading({Color? color, double? size}) {
    return SpinKitCircle(
      color: color ?? ColorsDef.kAccentColor,
      size: size ?? 25,
    );
  }

  static Widget spinKitWaveLoading({Color? color, double? size}) {
    return SpinKitWave(
      color: color ?? ColorsDef.kAccentColor,
      size: size ?? 35,
    );
  }

  //
}
