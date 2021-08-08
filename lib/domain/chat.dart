import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/chatdetail.dart';

class ChatField {
  static const docId = 'id';
  static const userId = 'userId';
  static const userName = 'userName';
  static const title = 'title';
  static const detail = 'detail';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
}

class Chat {
  final String? docId; //ChatTitle.docIdを代入
  final String? userId; //User.userIdを代入
  final String? userName; //User.nameを代入
  final String? title;
  final List<ChatDetail>? detail;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  Chat({
    this.docId,
    this.userId,
    this.userName,
    this.title,
    this.detail,
    this.createdAt,
    this.updatedAt,
  });

  factory Chat.fromFirestore(DocumentSnapshot snap) {
    final Map<String, dynamic> data = snap.data() as Map<String, dynamic>;

    return Chat(
      docId: data[ChatField.docId] ?? '',
      userId: data[ChatField.userId] ?? '',
      userName: data[ChatField.userName] ?? '',
      title: data[ChatField.title] ?? '',
      detail: List.from(data[ChatField.detail] ?? []),
      createdAt: data[ChatField.createdAt].toDate(),
      updatedAt: data[ChatField.updatedAt].toDate(),
    );
  }
}
