import 'package:eastarrow_app/domain/chatdetail.dart';
import 'package:eastarrow_app/domain/user.dart';
import 'package:eastarrow_app/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatDetailModel extends ChangeNotifier {
  final repository = ChatRepository();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  late List<ChatDetail> chatDetailList = [];

  ///画像選択時にリスト化
  late List<String> selectImageUrl = [];

  Future<void> init(Map chatTitle) async {
    titleController.text = chatTitle[ChatTitleField.title];
    notifyListeners();
  }

  Future<void> onPushSendChatDetail(Map chatTitle) async {
    final _chatDetail = createChatDetail();
    await repository.chatToFirestore(_chatDetail, chatTitle);
    notifyListeners();
  }

  ChatDetail createChatDetail() {
    return ChatDetail(
      body: bodyController.text,
      imageUrl: selectImageUrl,
    );
  }
}
