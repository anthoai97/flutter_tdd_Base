import 'package:awesome_app/core/utils/ui_utils.dart';
import 'package:awesome_app/resources/images.dart';
import 'package:flutter/material.dart';

class PlashScreen extends StatefulWidget {
  const PlashScreen({Key? key}) : super(key: key);

  @override
  _PlashScreenState createState() => _PlashScreenState();
}

class _PlashScreenState extends State<PlashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(ResImg.SPLASH_GIF, fit: BoxFit.cover),
    );
  }
}
