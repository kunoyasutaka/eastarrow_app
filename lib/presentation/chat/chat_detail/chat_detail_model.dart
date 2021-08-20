import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/chat.dart';
import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/repository/chat_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatDetailModel extends ChangeNotifier {
  final repository = ChatRepository();
  final bodyController = TextEditingController();
  List<Map> chatDetailList = [];
  late Chat chat;
  late Map chatDetail;

  ///画像選択時にリスト化
  List<String> selectImageUrl = [];

  Future<void> init(Map chatTitle) async {
    await fetchChat(chatTitle[ChatTitleField.docId]);
    notifyListeners();
  }

  ///chatのdocを呼んでchatDetail<Map>をリストに入れる
  Future<void> fetchChat(String docId) async {
    chat = await repository.fetchChat(docId);
    chatDetailList = chat.chatDetail!;
    notifyListeners();
  }

  ///chat入力内容をListに入れてDB(chatDetail)を更新
  Future<void> onPushSendChatDetail(Map chatTitle) async {
    createChatDetail();
    chatDetailList.add(chatDetail);
    await repository.updateChat(chatDetailList, chatTitle);
    resetChatDetail();
    notifyListeners();
  }

  ///chatの入力内容をMap型で返す
  void createChatDetail() {
    chatDetail = {
      'body': bodyController.text,
      'imageUrl': selectImageUrl,

      ///senderの表示をどうするか。仮でUIDを登録
      'sender': FirebaseAuth.instance.currentUser!.uid,
      'createdAt': Timestamp.fromDate(DateTime.now()),
    };
    notifyListeners();
  }

  ///本文と選択画像をリセット
  void resetChatDetail() {
    bodyController.text = '';
    selectImageUrl = [];
    notifyListeners();
  }
}
