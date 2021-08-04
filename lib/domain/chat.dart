import 'package:cloud_firestore/cloud_firestore.dart';

class ChatField {
  static const id = 'id';
  static const userId = 'userId';
  static const userName = 'userName';
  static const sender = 'sender';
  static const subject = 'subject';
  static const mainText = 'mainText';
  static const imageUrl = 'imageUrl';

  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
}

class Chat {
  final String? id;
  final String? userId;
  final String? userName;
  final String? sender;
  final String? subject;
  final String? mainText;
  final List<String>? imageUrl;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  Chat({
    this.id,
    this.userId,
    this.userName,
    this.sender,
    this.subject,
    this.mainText,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });


  factory Chat.fromFirestore(DocumentSnapshot snap) {
    final Map<String, dynamic> data = snap.data() as Map<String, dynamic>;

    return Chat(
      id: data[ChatField.id] ?? '',
      userId: data[ChatField.userId] ?? '',
      userName: data[ChatField.userName] ?? '',
      sender: data[ChatField.sender] ?? '',
      subject: data[ChatField.subject] ?? '',
      mainText: data[ChatField.mainText] ?? '',
      imageUrl: List<String>.from(data[ChatField.imageUrl] ?? []),
      createdAt: data[ChatField.createdAt].toDate(),
      updatedAt: data[ChatField.updatedAt].toDate(),
    );
  }
}