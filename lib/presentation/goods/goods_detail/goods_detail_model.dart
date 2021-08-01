import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class GoodsDetailModel extends ChangeNotifier {
  String bodyValueString = '本体価格';
  String bodyValue = '100';

  String totalValueString = '支払い総額';
  String totalValue = '120';

  String year = '2011年';
  String mileage = '7.5万km';
  String checkYear = '2022年4月';
  String repair = 'なし';
  String location = '愛知県尾張';

  CarouselController carouselController = CarouselController();
  List<String> detailImgList = [
    'https://ccsrpcma.carsensor.net/CSphoto/bkkn/061/789/U00035061789/U00035061789_001.JPG?ver=detail001&impolicy=car_002',
    'https://ccsrpcml.carsensor.net/CSphoto/ml/061/789/U00035061789/U00035061789_1_002.jpg?ver=detail001&impolicy=car_002',
    'https://ccsrpcml.carsensor.net/CSphoto/ml/061/789/U00035061789/U00035061789_2_002.jpg?ver=detail001&impolicy=car_002',
    'https://ccsrpcml.carsensor.net/CSphoto/ml/061/789/U00035061789/U00035061789_3_002.jpg?ver=detail001&impolicy=car_002',
    'https://ccsrpcml.carsensor.net/CSphoto/ml/061/789/U00035061789/U00035061789_4_002.jpg?ver=detail001&impolicy=car_002',
  ];
}
