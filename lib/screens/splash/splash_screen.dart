import 'package:awesome_app/navigator/app_navigator.dart';
import 'package:awesome_app/resources/R.dart';
import 'package:flutter/material.dart';

class PlashScreen extends StatefulWidget {
  const PlashScreen({Key? key}) : super(key: key);

  @override
  _PlashScreenState createState() => _PlashScreenState();
}

class _PlashScreenState extends State<PlashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 3));
      AppNavigator.navigateToHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(R.images.splashGif, fit: BoxFit.cover),
    );
  }
}
