import 'package:flutter/material.dart';

class GoodsListModel extends ChangeNotifier {
  List<String> imgList = [
    'https://ccsrpcma.carsensor.net/CSphoto/bkkn/933/463/U00034933463/U00034933463_001.JPG?ver=detail001&impolicy=car_002',
    'https://ccsrpcma.carsensor.net/CSphoto/bkkn/904/586/U00034904586/U00034904586_001.JPG?ver=detail001&impolicy=car_002',
    'https://ccsrpcma.carsensor.net/CSphoto/bkkn/322/213/U00033322213/U00033322213_001.JPG?ver=detail001&impolicy=car_002',
    'https://ccsrpcma.carsensor.net/CSphoto/bkkn/903/223/U00034903223/U00034903223_001.JPG?ver=detail001&impolicy=car_002',
    'https://ccsrpcma.carsensor.net/CSphoto/bkkn/937/696/U00033937696/U00033937696_001.JPG?ver=detail001&impolicy=car_002',
  ];

  String goodsName = 'メルセデス・ベンツ 190クラス';
  String introduction =
      'CLS350 ブルーエフィシェンシー AMGスポーツパッケージ/エアロ/AW/HID/ナビ/Bカメラ/地デジ';

  /// DBからのデータ取得処理をあとで書く
  Future<void> fetchGoodsData() async {}
}
