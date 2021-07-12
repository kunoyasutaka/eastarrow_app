import 'package:flutter/material.dart';

class HomePageModel extends ChangeNotifier {
  int sliderIndex = 0;
  List<String> imgList = [
    'https://east-arrow.com/images/inventory_benzb180.png',
    'https://east-arrow.com/images/inventory_toyota_mark2.png',
    'https://east-arrow.com/images/inventory_bmw5.png',
    'https://east-arrow.com/images/inventory_mazda_sclam.png',
  ];

  void pageChanged(int index) {
    sliderIndex = index;
    notifyListeners();
  }
}
