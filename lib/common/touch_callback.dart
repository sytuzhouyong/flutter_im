// 触摸回调封装

import 'package:flutter/material.dart';

class TouchCallBack extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isFeed;
  final Color bgColor;

  TouchCallBack({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.isFeed: true,
    this.bgColor: const Color(0xFFD8D8D8),
  }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TouchCallBackState();
  }
}

class TouchCallBackState extends State<TouchCallBack> {
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (d) {
        print('onPanDown: $d');

        if (widget.isFeed == false)
          return;

        setState(() {
          color = widget.bgColor;
        });
      },
      onPanCancel: () {
        print('onPanCancel');
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}