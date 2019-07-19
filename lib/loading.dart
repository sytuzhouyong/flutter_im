// 加载页面
import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoadingState();
  }
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 3), () {
      print('Flutter IM App');
      Navigator.of(context).pushReplacementNamed('app');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset('images/loading.png', fit: BoxFit.cover,),
            decoration: BoxDecoration(
//              color: Colors.green,
              border: Border.all(
                color: Colors.red,
                width: 1,
                style: BorderStyle.solid
              ),
            )
          ),
          Text('xxx'),
        ],
      ),
    );
  }
}