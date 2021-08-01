import 'package:cloud_firestore/cloud_firestore.dart';

class InfomationField {
  static const id = 'id';
  static const title = 'title';
  static const body = 'body';
  static const imageUrl = 'imageUrl';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
}

class Infomation {
  final String? id;
  final String? title;
  final String? body;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Infomation({
    this.id,
    this.title,
    this.body,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Infomation.fromFirestore(DocumentSnapshot snap) {
    final Map<String, dynamic> data = snap.data() as Map<String, dynamic>;

    return Infomation(
      id: data[InfomationField.id] ?? '',
      title: data[InfomationField.title] ?? '',
      body: data[InfomationField.body] ?? '',
      imageUrl: data[InfomationField.imageUrl] ?? '',
      createdAt: data[InfomationField.createdAt],
      updatedAt: data[InfomationField.updatedAt],
    );
  }
}
