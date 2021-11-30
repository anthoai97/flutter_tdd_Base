import 'package:awesome_app/core/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ApiCallDemo extends StatefulWidget {
  ApiCallDemo({Key? key}) : super(key: key);

  @override
  _ApiCallDemoState createState() => _ApiCallDemoState();
}

class _ApiCallDemoState extends State<ApiCallDemo> {
  int _counter = 0;

  void _callApi() {}

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
                var _result = await ApiService.get(_path);
                print(_result.data);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Call Api'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _callApi,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
