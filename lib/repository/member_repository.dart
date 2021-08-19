import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/member.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class MemberRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'member';
  late DocumentReference _memberDocRef;

  ///DBのmemberを取得してMember型で返す
  Future<Member> fetchMember(String userId) async {
    try {
      final snaps = await _db.collection(_collectionPath).doc(userId).get();

      return Member.fromFirestore(snaps);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  ///DBのmemberのchatTitleをアップデート（新規件名作成時に呼び出す）
  Future<void> updateChatTitle(List<Map> chatTitleList, String userId) async {
    try {
      await _db.collection(_collectionPath).doc(userId).update({
        MemberField.chatTitle: chatTitleList,
      });
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  ///DBのmemberをアップデート（マイページで呼び出す）
  Future<void> updateMember(Member member) async {
    try {
      await _db.collection(_collectionPath).doc(FirebaseAuth.instance.currentUser!.uid).update({
        MemberField.name: member.name,
        MemberField.email:member.email,
        MemberField.location:member.location,
        MemberField.phoneNumber:member.phoneNumber,
        MemberField.birthDate:member.birthDate,
        MemberField.carType:member.carType,
        MemberField.inspectionDay:member.inspectionDay,
        MemberField.updatedAt:Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  ///新規登録画面でMember情報を登録
  Future<void> addMember(Member member) async {
    try {
      _memberDocRef = _db.collection(_collectionPath).doc(FirebaseAuth.instance.currentUser!.uid);
      await _memberDocRef.set({
        MemberField.id: _memberDocRef.id,
        MemberField.name: member.name,
        MemberField.email:member.email,
        MemberField.location: member.location,
        MemberField.phoneNumber:member.phoneNumber,
        MemberField.birthDate:member.birthDate,
        MemberField.carType:member.carType,
        MemberField.inspectionDay:member.inspectionDay,
        MemberField.createdAt: Timestamp.fromDate(DateTime.now()),
        MemberField.updatedAt: Timestamp.fromDate(DateTime.now()),
      });

    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}