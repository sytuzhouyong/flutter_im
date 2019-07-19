// 好友页面

import 'package:flutter/material.dart';
import 'contact_item.dart';
import 'contact_header.dart';
import 'contact_sider_list.dart';
import 'contact_vo.dart';

class ContactsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ContactsPageState();
  }
}

class ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ContactList(
        contacts: contactData,
        headerBuild: (BuildContext context, int index) {
          return Container(
            child: ContactHeader(),
          );
        },
        itemBuild: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: ContactItem(contact: contactData[index],),
          );
        },
        sectionBuilder: (BuildContext context, int index) {
          return Container(
            height: 32,
            padding: const EdgeInsets.only(left: 14),
            alignment: Alignment.centerLeft,
            color: Colors.grey[300],
            // 显示字母
            child: Text(
              contactData[index].prefixKey,
              style: TextStyle(fontSize: 14, color: Color(0xFF909090)),
            ),
          );
        }
      ),
    );
  }
}