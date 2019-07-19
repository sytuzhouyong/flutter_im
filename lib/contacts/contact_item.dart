// 好友列表项

import 'package:flutter/material.dart';
import 'contact_vo.dart';

class ContactItem extends StatelessWidget {
  final ContactVO contact;
  final String titleName;
  final String imageName;

  ContactItem({this.contact, this.titleName, this.imageName});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFD9D9D9))),
      ),
      child: FlatButton(
        onPressed: null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageName ?? contact.avatarUrl, width: 36, height: 36,),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Text(
                this.titleName == null ? contact.name ?? '暂时' : this.titleName,
                style: TextStyle(fontSize: 18, color: Color(0xFF353535)),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            )
          ],
        )
      ),
    );
  }
}