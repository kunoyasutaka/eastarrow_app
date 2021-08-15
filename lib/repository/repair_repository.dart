import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/repair.dart';
import 'package:logger/logger.dart';

class RepairRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'repair';
  late DocumentReference _docRef;

  Future<void> repairToFirestore(Repair repair) async {
    try {
      _docRef = _db.collection(_collectionPath).doc();
      await _docRef.set({
        RepairField.id: _docRef.id,
        RepairField.userId: 'ZIMFU3g9CuQxuXJMFi1L', //仮で設定(AuthのUIDを指定)
        RepairField.carMaker: repair.carMaker,
        RepairField.carType: repair.carType,
        RepairField.inspectionExpiration: repair.inspectionExpiration,
        RepairField.inquiry: repair.inquiry,
        RepairField.remark: repair.remark,
        RepairField.createdAt: Timestamp.fromDate(DateTime.now()),
      });

    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
