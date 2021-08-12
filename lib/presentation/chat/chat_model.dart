import 'package:eastarrow_app/domain/chatdetail.dart';
import 'package:eastarrow_app/domain/user.dart';
import 'package:eastarrow_app/repository/chat_repository.dart';
import 'package:eastarrow_app/repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatModel extends ChangeNotifier {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final userRepository = UserRepository();
  final chatRepository = ChatRepository();
  late User user;
  late List<Map> chatTitleList = [];
  late List<ChatDetail> chatDetailList = [];
  late Map chatTitle;
  ///画像選択時にリスト化
  late List<String> selectImageUrl = [];

  Future<void> init() async {
    await fetchChatTitle('ZIMFU3g9CuQxuXJMFi1L');
    notifyListeners();
  }

  Future<void> fetchChatTitle(String userId) async {
    user = await userRepository.fetchUser(userId);
    chatTitleList = user.chatTitle ?? [];
    notifyListeners();
  }

  Future<void> fetchChatDetail(String docId) async {
    chatDetailList = await chatRepository.fetchChatDetail(docId);
    notifyListeners();
  }
}
