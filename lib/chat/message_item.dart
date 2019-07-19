// 消息项
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import '../common/touch_callback.dart';

class MessageCellItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TouchCallBack(
        isFeed: false,
        onPressed: () {
          print('sss');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            // 头像
            Container(
              child: Image.asset('images/icon_avatar_1.png', scale: 5,),
              margin: const EdgeInsets.only(left: 13, right: 13),
            ),
            // 主副标题
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 垂直方向居中
                crossAxisAlignment: CrossAxisAlignment.start, // 水平方向左对齐
                children: <Widget>[
                  Text(
                    '聊天主标题1',
                    style: TextStyle(fontSize: 16, color: Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  // 中间间隔
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                  ),
                  Text(
                    '聊天副标题1',
                    style: TextStyle(fontSize: 14, color: Color(0xFFa9a9a9)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,  // 省略号
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsets.only(right: 12, top: 12),
              child: Text(
                formatDate(DateTime.now(), [HH, ':', nn, ':', 'ss']).toString(),
                style: TextStyle(fontSize: 14, color: Color(0xFFA9A9A9)),
              ),
            )
          ],
        ),
      ),
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFD9D9D9))),
      ),
    );
  }
}