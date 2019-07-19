import 'package:flutter/material.dart';
import './app.dart';
import './loading.dart';
import './search.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '聊天室',
      theme: mTheme,
      routes: <String, WidgetBuilder> {
        'app': (BuildContext context) => new App(),
        'search': (BuildContext context) => new SearchPage(),
        '/friends': (_) => new WebviewScaffold(
          url: 'https://flutter.io',
          appBar: AppBar(
            title: Text('Flutter官网'),
          ),
          withZoom: true,
          withLocalStorage: true,
        )
      },
      home: new LoadingPage(),
    );
  }
}

final ThemeData mTheme = new ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Color(0xffebebeb),
  cardColor: Colors.green,
);
