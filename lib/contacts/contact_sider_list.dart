// 好友列表

import 'package:flutter/material.dart';
import 'contact_vo.dart';

class ContactList extends StatefulWidget {

  final List<ContactVO> contacts;
  final IndexedWidgetBuilder headerBuild; // 好友列表头构造器
  final IndexedWidgetBuilder itemBuild;   // 好友列表项构造器
  final IndexedWidgetBuilder sectionBuilder; // 字母头构造器

  ContactList({
    Key key,
    @required this.contacts,
    this.headerBuild,
    @required this.itemBuild,
    @required this.sectionBuilder,
}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ContactListState();
  }

}

class ContactListState extends State<ContactList> {
  // 列表滚动控制器
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  // 判断并显示头部视图或空容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuild != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuild(context, index),
      );
    }
    return Container();
  }

  bool _shouldShowHeader(int position) {
    if (position <= 0) {
      return false;
    }

    if (position != 0 && widget.contacts[position].prefixKey != widget.contacts[position - 1].prefixKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // 列表加载更多
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
              // 滚动控制器
              controller: _scrollController,
              // 列表内容不足一屏时，列表也可以滑动
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: widget.contacts.length,
              itemBuilder: (BuildContext context, int index) {
                // 列表项容器
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      // 显示列表头
                      _isShowHeaderView(index),
                      // 用offstage组件控制是否显示英文字母
                      Offstage(
                        offstage: _shouldShowHeader(index),
                        child: widget.sectionBuilder(context, index),
                      ),
                      // 显示列表项
                      Column(
                        children: <Widget>[
                          widget.itemBuild(context, index)
                        ],
                      ),
                    ],
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}