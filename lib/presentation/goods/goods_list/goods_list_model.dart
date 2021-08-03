import 'package:eastarrow_app/domain/goods.dart';
import 'package:flutter/material.dart';
import 'package:eastarrow_app/repository/goods_repository.dart';

class GoodsListModel extends ChangeNotifier {
  final repository = GoodsRepository();
  late List<Goods> goodsList = [];

  Future<void> init() async {
    await fetchGoodsList();
    notifyListeners();
  }

  Future<void> fetchGoodsList() async {
    goodsList = await repository.fetchGoodsList();
    notifyListeners();
  }
}
