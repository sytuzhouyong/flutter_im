// 好友vo类

class ContactVO {
  String prefixKey;
  String name;
  String avatarUrl;

  ContactVO({this.prefixKey, this.name, this.avatarUrl});
}

List<ContactVO> contactData = [
  ContactVO(prefixKey: 'A', name: '张三', avatarUrl: 'images/icon_avatar_2.png'),
  ContactVO(prefixKey: 'A', name: '阿黄', avatarUrl: 'images/icon_avatar_3.png'),
  ContactVO(prefixKey: 'B', name: 'bobo', avatarUrl: 'images/icon_avatar_4.png'),
];