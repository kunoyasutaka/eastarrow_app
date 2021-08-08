
class ChatTitleField {
  static const docId = 'docId';
  static const title = 'title';
  static const createdAt = 'createdAt';
}

class ChatTitle {
  final String? docId;
  final String? title;
  final DateTime? createdAt;

  ChatTitle({
    this.docId,
    this.title,
    this.createdAt,
  });
}