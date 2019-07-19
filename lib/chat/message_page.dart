// 消息页面
import 'package:flutter/material.dart';
import 'message_item.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext ctx, int index) {
          return new MessageCellItem();
        }),
    );
  }
}