import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/chat.dart';
import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/repository/member_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class ChatRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'chat';
  late DocumentReference _chatDocRef;
  late List<Map> _chatTitleList;

  ///chatのdocを呼んでChat型を返す
  Future<Chat> fetchChat(String docId) async {
    try {
      final snapshot = await _db.collection(_collectionPath).doc(docId).get();
      return Chat.fromFirestore(snapshot);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  ///chatDetail<List<Map>>をアップデート（ChatDetail画面から送信した場合の処理）
  Future<void> updateChat(List<Map> chatDetailList, Map chatTitle) async {
    try {
      await _db
          .collection(_collectionPath)
          .doc(chatTitle[ChatTitleField.docId])
          .update({
        ChatField.chatDetail: chatDetailList,
      });
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  ///新規の連絡開始時に使う
  Future<void> addChat(List<Map> chatDetailList, List<Map> chatTitleList,
      String title, String userId) async {
    try {
      _chatDocRef = _db.collection(_collectionPath).doc();
      await _chatDocRef.set({
        ChatField.docId: _chatDocRef.id,
        ChatField.userId: FirebaseAuth.instance.currentUser!.uid,
        ChatField.title: title,
        ChatField.chatDetail: chatDetailList,
        ChatField.createdAt: Timestamp.fromDate(DateTime.now()),
        ChatField.updatedAt: Timestamp.fromDate(DateTime.now()),
      });

      ///userIdのdocのchatTitleを更新
      Map _chatTitle = {
        ChatTitleField.docId: _chatDocRef.id,
        ChatTitleField.title: title
      };
      _chatTitleList = chatTitleList;
      _chatTitleList.add(_chatTitle);
      await MemberRepository().updateChatTitle(_chatTitleList, userId);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
