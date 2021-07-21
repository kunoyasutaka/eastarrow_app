import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatModel extends ChangeNotifier {
  final List<ChatLog> chatLog = [
    ChatLog('管理者', '新車種の入荷①', '2021/7/20 20:00', '新たに〇〇が入荷致しました。'),
    ChatLog('ユーザー', '車検のお知らせ①', '2021/7/20 19:00', '車検についてお知らせ致します。'),
    ChatLog('管理者', '新車種の入荷②', '2021/7/20 18:00', '新たに〇〇が入荷致しました。'),
    ChatLog('ユーザー', '車検のお知らせ②', '2021/7/20 17:00', '車検についてお知らせ致します。'),
    ChatLog('管理者', '新車種の入荷③', '2021/7/20 16:00', '新たに〇〇が入荷致しました。'),
  ];
  List<ChatLog> administratorChatLog = [];
  List<ChatLog> userChatLog = [];
  final subjectController = TextEditingController();
  final mainTextController = TextEditingController();

  whereAdministratorChatLog() {
    administratorChatLog =
        chatLog.where((chatLog) => chatLog.sender == '管理者').toList();
  }

  whereInStockInformation() {
    userChatLog = chatLog.where((chatLog) => chatLog.sender == 'ユーザー').toList();
  }

  Widget? replyButton(ChatLog chatLog) {
    if (chatLog.sender == '管理者')
    {return const IconButton(onPressed: null, icon: Icon(Icons.reply));}
  }
}

class ChatLog {
  String sender;
  String title;
  String date;
  String description;

  ChatLog(this.sender, this.title, this.date, this.description);
}