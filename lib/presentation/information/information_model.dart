import 'package:flutter/material.dart';

class InformationModel extends ChangeNotifier {
  final List<Information> information = [
    Information('inStock', '新車種の入荷①', '2021/7/20', '新たに〇〇が入荷致しました。'),
    Information('inspection', '車検のお知らせ①', '2021/7/20', '車検についてお知らせ致します。'),
    Information('inStock', '新車種の入荷②', '2021/7/20', '新たに〇〇が入荷致しました。'),
    Information('inspection', '車検のお知らせ②', '2021/7/20', '車検についてお知らせ致します。'),
    Information('inStock', '新車種の入荷③', '2021/7/20', '新たに〇〇が入荷致しました。'),
  ];
  List<Information> inspectionInformation = [];
  List<Information> inStockInformation = [];

  void whereInspectionInformation() {
    inspectionInformation = information
        .where(
            (Information information) => information.classify == 'inspection')
        .toList();
  }

  void whereInStockInformation() {
    inStockInformation = information
        .where((Information information) => information.classify == 'inStock')
        .toList();
  }
}

class Information {
  String classify;
  String title;
  String date;
  String description;

  Information(this.classify, this.title, this.date, this.description);
}
