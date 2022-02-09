import 'package:awesome_app/core/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocaleSettingDemo extends StatefulWidget {
  LocaleSettingDemo({Key? key}) : super(key: key);

  @override
  _LocaleSettingDemoState createState() => _LocaleSettingDemoState();
}

class _LocaleSettingDemoState extends State<LocaleSettingDemo> {
  int _counter = 0;

  void _incrementCounter() {
    var locale;
    if (context.locale.languageCode == 'en') {
      locale = Locale('vi');
    } else {
      locale = Locale('en');
    }
    context.setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locale Setting Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'example.helloWorld'.tr(),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () async {
                var _path = 'http://localhost:3000/test/api';
                var _result = await ApiService().get(_path);
                print(_result.data);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Call Api'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
