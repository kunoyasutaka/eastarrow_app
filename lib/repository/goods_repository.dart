import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/goods.dart';
import 'package:logger/logger.dart';

class GoodsRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'goods';

  Future<List<Goods>> fetchGoodsList() async {
    try {
      final snapshot = await _db.collection(_collectionPath).get();

      return snapshot.docs.map((e) => Goods.fromFirestore(e)).toList();
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
  Future<Goods> fetchGoods(String goodsId) async {
    try {
      final snaps = await _db.collection(_collectionPath).doc(goodsId).get();

      return Goods.fromFirestore(snaps);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
