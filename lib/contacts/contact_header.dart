// 好友头部列表

import 'package:flutter/material.dart';
import 'contact_item.dart';

class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ContactItem(titleName: '新加好友', imageName: 'images/icon_addfriend.png',),
        ContactItem(titleName: '聊天室', imageName: 'images/icon_groupchat.png',),
      ],
    );
  }
}
