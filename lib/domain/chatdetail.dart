import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDetailField {
  static const id = 'id';
  static const sender = 'sender';
  static const body = 'body';
  static const imageUrl = 'imageUrl';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
}


class ChatDetail {
  final String? id;
  final String? sender;
  final String? body;
  final List<String>? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ChatDetail({
    this.id,
    this.sender,
    this.body,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatDetail.fromFirestore(DocumentSnapshot snap) {
    final Map<String, dynamic> data = snap.data() as Map<String, dynamic>;

    return ChatDetail(
      id: data[ChatDetailField.id] ?? '',
      sender: data[ChatDetailField.sender] ?? '',
      body: data[ChatDetailField.body] ?? '',
      imageUrl: List<String>.from(data[ChatDetailField.imageUrl] ?? []),
      createdAt: data[ChatDetailField.createdAt].toDate(),
      updatedAt: data[ChatDetailField.updatedAt].toDate(),
    );
  }
}