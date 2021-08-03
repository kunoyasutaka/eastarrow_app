import 'package:eastarrow_app/domain/goods.dart';
import 'package:flutter/material.dart';
import 'package:eastarrow_app/repository/goods_repository.dart';

class GoodsListModel extends ChangeNotifier {
  final repository = GoodsRepository();
  late List<Goods> goodsList = [];

  Future<void> init() async {
    goodsList = await repository.fetchGoodsList();
    notifyListeners();
  }

  late Goods goods;

  Future<void> fetchGoods(String goodsId) async {
    goods = await repository.fetchGoods(goodsId);
    notifyListeners();
  }
}
