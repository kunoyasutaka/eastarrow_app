import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatModel extends ChangeNotifier {
  final List<ChatLog> chatLog = [
    ChatLog('お客様ご検討の車種について', chatDetail),
    ChatLog('車検について', chatDetail),
    ChatLog('車の整備について', chatDetail),
  ];

  static List<ChatDetail> chatDetail = [
    ChatDetail('管理者', '新車種の入荷①', '2021/7/20 20:00', '新たに〇〇が入荷致しました。', ''),
    ChatDetail('ユーザー', '車検のお知らせ①', '2021/7/20 19:00', '車検についてお知らせ致します。',
        'https://ccsrpcma.carsensor.net/CSphoto/bkkn/933/463/U00034933463/U00034933463_001.JPG?ver=detail001&impolicy=car_002'),
    ChatDetail('管理者', '新車種の入荷②', '2021/7/20 18:00', '新たに〇〇が入荷致しました。',
        'https://ccsrpcma.carsensor.net/CSphoto/bkkn/322/213/U00033322213/U00033322213_001.JPG?ver=detail001&impolicy=car_002'),
    ChatDetail('ユーザー', '車検のお知らせ②', '2021/7/20 17:00', '車検についてお知らせ致します。',
        'https://ccsrpcma.carsensor.net/CSphoto/bkkn/903/223/U00034903223/U00034903223_001.JPG?ver=detail001&impolicy=car_002'),
    ChatDetail('管理者', '新車種の入荷③', '2021/7/20 16:00', '新たに〇〇が入荷致しました。', ''),
  ];

  final subjectController = TextEditingController();
  final mainTextController = TextEditingController();

  /// TODO DBからの取得処理をあとで書く
  Future<void> fetchChatData() async {}
}

class ChatLog {
  String title;
  List<ChatDetail> chatDetail;

  ChatLog(this.title, this.chatDetail);
}

class ChatDetail {
  String sender;
  String title;
  String date;
  String description;
  String imageURL;

  ChatDetail(
      this.sender, this.title, this.date, this.description, this.imageURL);
}
