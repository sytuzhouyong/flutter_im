// 搜索页面

import 'package:flutter/material.dart';
import 'common/touch_callback.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                // 返回按钮
                TouchCallBack(
                  isFeed: false,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    child: Icon(Icons.chevron_left, color: Colors.black,),
                  ),
                ),
                // 搜索框
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 50, top: 2),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Colors.green))
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          focusNode: _requestFocusNode(),
                          style: TextStyle(color: Colors.black, fontSize: 16, ),
                          onChanged: (String text) {
                            print('text changed to $text');
                          },
                          decoration: InputDecoration(
                            hintText: '搜索',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.mic, color: Color(0xFFAAAAAAA),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _requestFocusNode() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }
}