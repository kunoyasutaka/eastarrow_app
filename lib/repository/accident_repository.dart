import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/accident.dart';
import 'package:logger/logger.dart';

class AccidentRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'accident';
  late DocumentReference _docRef;

  Future<void> accidentToFirestore(Accident accident) async {
    try {
      _docRef = _db.collection(_collectionPath).doc();
      await _docRef.set({
        AccidentField.id: _docRef.id, //IDの取得方法？
        AccidentField.userId: 'ZIMFU3g9CuQxuXJMFi1L', //仮で設定(AuthのUIDを指定)
        AccidentField.policyNumber: accident.policyNumber,
        AccidentField.carDamage: accident.carDamage,
        AccidentField.injury: accident.injury,
        AccidentField.opponent: accident.opponent,
        AccidentField.accidentSituation: accident.accidentSituation,
        AccidentField.createdAt: Timestamp.fromDate(DateTime.now()), //Datetime.now()→Timestampに変換
      });
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
