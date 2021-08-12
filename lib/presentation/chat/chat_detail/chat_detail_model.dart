import 'package:eastarrow_app/domain/chat.dart';
import 'package:eastarrow_app/domain/chatdetail.dart';
import 'package:eastarrow_app/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatDetailModel extends ChangeNotifier {
  final repository = ChatRepository();
  late List<ChatDetail> chatDetailList = [];
  late Chat chat;

  Future<void> init(docId) async {
    await fetchChatDetail(docId);
    notifyListeners();
  }

  Future<void> fetchChatDetail(String docId) async {
    chatDetailList = await repository.fetchChatDetail(docId);
    notifyListeners();
  }
}
