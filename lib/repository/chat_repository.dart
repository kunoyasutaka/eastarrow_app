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

  Future<void> chatToFirestore(ChatDetail chatDetail, Map chatTitle) async {
    try {
      _docRef = _db
          .collection(_chatCollectionPath)
          .doc(chatTitle[ChatTitleField.docId])
          .collection(_chatDetailCollectionPath)
          .doc();
      _user = await UserRepository().fetchUser('ZIMFU3g9CuQxuXJMFi1L');
      await _docRef.set({
        ChatDetailField.id: _docRef.id,
        ChatDetailField.sender: _user.name,
        ChatDetailField.body: chatDetail.body,

        ///仮で登録
        ChatDetailField.imageUrl: [
          'https://ccsrpcma.carsensor.net/CSphoto/bkkn/933/463/U00034933463/U00034933463_001.JPG?ver=detail001&impolicy=car_002',
        ],
        ChatDetailField.createdAt: Timestamp.fromDate(DateTime.now()),
        ChatDetailField.updatedAt: Timestamp.fromDate(DateTime.now()),
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
