import 'package:eastarrow_app/domain/chatdetail.dart';
import 'package:eastarrow_app/domain/user.dart';
import 'package:eastarrow_app/repository/chat_repository.dart';
import 'package:eastarrow_app/repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatModel extends ChangeNotifier {
  // final List<ChatLog> chatLog = [
  //   ChatLog('お客様ご検討の車種について', chatDetails),
  //   ChatLog('車検について', chatDetails),
  //   ChatLog('車の整備について', chatDetails),
  // ];
  //
  // static List<ChatDetails> chatDetails = [
  //   ChatDetails('管理者', '新車種の入荷①', '2021/7/20 20:00', '新たに〇〇が入荷致しました。', ''),
  //   ChatDetails('ユーザー', '車検のお知らせ①', '2021/7/20 19:00', '車検についてお知らせ致します。',
  //       'https://ccsrpcma.carsensor.net/CSphoto/bkkn/933/463/U00034933463/U00034933463_001.JPG?ver=detail001&impolicy=car_002'),
  //   ChatDetails('管理者', '新車種の入荷②', '2021/7/20 18:00', '新たに〇〇が入荷致しました。',
  //       'https://ccsrpcma.carsensor.net/CSphoto/bkkn/322/213/U00033322213/U00033322213_001.JPG?ver=detail001&impolicy=car_002'),
  //   ChatDetails('ユーザー', '車検のお知らせ②', '2021/7/20 17:00', '車検についてお知らせ致します。',
  //       'https://ccsrpcma.carsensor.net/CSphoto/bkkn/903/223/U00034903223/U00034903223_001.JPG?ver=detail001&impolicy=car_002'),
  //   ChatDetails('管理者', '新車種の入荷③', '2021/7/20 16:00', '新たに〇〇が入荷致しました。', ''),
  // ];

  final subjectController = TextEditingController();
  final mainTextController = TextEditingController();
  late User user;
  late List<Map> chatTitleList = [];
  late List<ChatDetail> chatDetailList = [];

  Future<void> init() async {
    await fetchChatTitle('ZIMFU3g9CuQxuXJMFi1L');
    notifyListeners();
  }

  Future<void> fetchChatTitle(String userId) async {
    user = await UserRepository().fetchUser(userId);
    chatTitleList = user.chatTitle ?? [];
    notifyListeners();
  }
  Future<void> fetchChatDetail(String docId) async {
    chatDetailList = await ChatRepository().fetchChatDetail(docId);
    notifyListeners();
  }
}

// class ChatLog {
//   String title;
//   List<ChatDetails> chatDetail;
//
//   ChatLog(this.title, this.chatDetail);
// }
//
// class ChatDetails {
//   String sender;
//   String title;
//   String date;
//   String description;
//   String imageURL;
//
//   ChatDetails(this.sender, this.title, this.date, this.description, this.imageURL);
// }
