import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/chat.dart';
import 'package:eastarrow_app/domain/chatdetail.dart';
import 'package:eastarrow_app/domain/user.dart';
import 'package:eastarrow_app/repository/user_repository.dart';
import 'package:logger/logger.dart';

class ChatRepository {
  final _db = FirebaseFirestore.instance;
  final _chatCollectionPath = 'chat';
  final _usersCollectionPath = 'users';
  final _chatDetailCollectionPath = 'detail';
  late DocumentReference _docRef;
  late User _user;

  Future<List<ChatDetail>> fetchChatDetail(String docId) async {
    try {
      final snaps = await _db.collection(_chatCollectionPath).doc(docId).collection(_chatDetailCollectionPath).get();
      return snaps.docs.map((e) => ChatDetail.fromFirestore(e)).toList();
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  ///使わなければ削除
  Future<Chat> fetchChat(String docId) async {
    try {
      final snapshot = await _db.collection(_chatCollectionPath).doc(docId).get();
      return Chat.fromFirestore(snapshot);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  Future<void> chatToFirestore(Chat chat) async {
    try {
      _docRef = _db.collection(_chatCollectionPath).doc();
      _user = await UserRepository().fetchUser('ZIMFU3g9CuQxuXJMFi1L');
      await _db.collection(_chatCollectionPath).doc(_docRef.id).set({
        ChatField.docId: _docRef.id, //IDの取得方法？
        ChatField.userId: 'ZIMFU3g9CuQxuXJMFi1L', //仮で設定(AuthのUIDを指定)
        ChatField.userName: _user.name, //仮で設定（DBからの取得方法？）
        ChatField.title: chat.title,
        ChatField.detail: chat.detail,
        ChatField.createdAt: Timestamp.fromDate(DateTime.now()),
        ChatField.updatedAt: Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  ///編集中
  Future<void> chatTitleToFirestore(Chat chat) async {
    await _db.collection(_usersCollectionPath).doc('ZIMFU3g9CuQxuXJMFi1L')

        ///仮で設定（AuthのUIDを指定）
        .update({
      ChatTitleField.docId: '',

      ///chatと同じdocIDを代入
      ChatTitleField.title: chat.title,
    });
  }
}
