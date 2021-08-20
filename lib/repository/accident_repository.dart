import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/accident.dart';
import 'package:logger/logger.dart';

class AccidentRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'accident';
  late DocumentReference _docRef;

  Future<void> addAccident(Accident accident, String uid) async {
    try {
      _docRef = _db.collection(_collectionPath).doc();
      await _docRef.set({
        AccidentField.id: _docRef.id,
        AccidentField.userId: uid,
        AccidentField.policyNumber: accident.policyNumber,
        AccidentField.carDamage: accident.carDamage,
        AccidentField.injury: accident.injury,
        AccidentField.opponent: accident.opponent,
        AccidentField.accidentSituation: accident.accidentSituation,
        AccidentField.createdAt: Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
