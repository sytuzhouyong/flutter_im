// 主页面

import 'package:flutter/material.dart';
import 'chat/message_page.dart';
import 'contacts/contacts.dart';
import 'personal/personal.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AppState();
  }
}

class _AppState extends State<App> {
  int _currentIndex;
  List<BottomBarItemConfig> _barConfigs;

  MessagePage message;  // 消息页面
  ContactsPage contact; // 好友页面


  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _barConfigs = BottomBarItemsConfig().configs;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('即时通讯'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: GestureDetector(
              onTap: () {
                showPopupMenu();
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text(_barConfigs[0].text),
            icon: Image.asset(currentImageNameAtIndex(0), scale: 6,),
          ),
          BottomNavigationBarItem(
            title: Text(_barConfigs[1].text),
            icon: Image.asset(currentImageNameAtIndex(1), scale: 6,),
          ),
          BottomNavigationBarItem(
            title: Text(_barConfigs[2].text),
            icon: Image.asset(currentImageNameAtIndex(2), scale: 6,),
          ),
        ],
        onTap: ((index) {

          setState(() {
            _currentIndex = index;
          });
        }),
      ),
    );
  }

  currentPage() {
    switch(_currentIndex) {
      case 0:
        if (message == null) {
          message = new MessagePage();
        }
        return message;
      case 1:
        contact ??= new ContactsPage();
        return contact;
      default:
        if (message == null) {
          message = new MessagePage();
        }
        return message;
    }
  }

  String currentImageNameAtIndex(int index) {
    return _currentIndex == index ? _barConfigs[index].selectedImageName : _barConfigs[index].normalImageName;
  }

  showPopupMenu() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(500, 100, 0, 10),
      items: <PopupMenuEntry>[
        popupMenuItem('发起会话', imagePath: 'images/icon_groupchat.png'),
        popupMenuItem('添加好友', imagePath: 'images/icon_addfriend.png'),
        popupMenuItem('联系客服', imagePath: 'images/icon_me_service.png'),
      ]
    );
  }

  // 可选参数
  popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
            ? Image.asset(imagePath, width: 32, height: 32,)
            : SizedBox(width: 32, height: 32, child: Icon(icon, color: Colors.white,),),
          Container(
            child: Text(title, style: TextStyle(color: Colors.white),),
            padding: const EdgeInsets.only(left: 30, right: 20),
          )
        ],
      ),
    );
  }
}


class BottomBarItemConfig {
  String text;
  String normalImageName;
  String selectedImageName;

  BottomBarItemConfig(String text, String normalImageName, String selectedImageName) {
    this.text = text;
    this.normalImageName = normalImageName;
    this.selectedImageName = selectedImageName;
  }
}

class BottomBarItemsConfig {
  List<BottomBarItemConfig> configs;

  BottomBarItemsConfig() {
    configs = [
      BottomBarItemConfig('聊天', 'images/icon_chat.png', 'images/icon_chat_selected.png'),
      BottomBarItemConfig('好友', 'images/icon_list_normal.png', 'images/icon_list_pressed.png'),
      BottomBarItemConfig('我的', 'images/icon_me.png', 'images/icon_me_selected.png'),
    ];
  }
}
