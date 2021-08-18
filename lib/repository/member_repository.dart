import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/member.dart';
import 'package:logger/logger.dart';

class MemberRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'member';

  ///memberのdocを取得してMember型で返す
  Future<Member> fetchMember(String userId) async {
    try {
      final snaps = await _db.collection(_collectionPath).doc(userId).get();

      return Member.fromFirestore(snaps);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  ///memberのdocのchatTitleをアップデート（新規件名作成時に使用）
  Future<void> updateChatTitle(List<Map> chatTitleList,String userId) async {
    try {
      await _db.collection(_collectionPath).doc(userId).update({
        MemberField.chatTitle: chatTitleList,
      });
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}