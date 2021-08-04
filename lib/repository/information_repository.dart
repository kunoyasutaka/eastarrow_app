import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/infomation.dart';
import 'package:logger/logger.dart';

class InformationRepository{
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'information';

  Future<List<Information>> fetchInformationList() async {
    try {
      final snapshot = await _db.collection(_collectionPath).get();

      return snapshot.docs.map((e) => Information.fromFirestore(e)).toList();
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}