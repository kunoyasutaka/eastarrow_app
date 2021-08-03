import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class GoodsDetailModel extends ChangeNotifier {
  String bodyValueString = '本体価格';
  String totalValueString = '支払い総額';

  CarouselController carouselController = CarouselController();
}
