import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/user.dart';
import 'package:logger/logger.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'users';

  ///usersのdocを取得してUser型で返す
  Future<User> fetchUser(String userId) async {
    try {
      final snaps = await _db.collection(_collectionPath).doc(userId).get();

      return User.fromFirestore(snaps);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  ///usersのdocのchatTitleをアップデート（新規件名作成時に使用）
  Future<void> updateChatTitle(List<Map> chatTitleList,String userId) async {
    try {
      await _db.collection(_collectionPath).doc(userId).update({
        UserField.chatTitle: chatTitleList,
      });
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
