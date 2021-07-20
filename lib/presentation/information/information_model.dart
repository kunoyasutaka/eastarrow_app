import 'package:eastarrow_app/presentation/information/information_tab/information_all_page.dart';
import 'package:eastarrow_app/presentation/information/information_tab/information_inspection_page.dart';
import 'package:eastarrow_app/presentation/information/information_tab/information_instock_page.dart';
import 'package:flutter/material.dart';

class InformationModel extends ChangeNotifier {
  final List<TabInfo> tabInfo = [
    TabInfo('すべて', const InformationAllPage()),
    TabInfo('入荷情報', const InformationInspectionPage()),
    TabInfo('車検情報', const InformationInStockPage()),
  ];

  final List<Information> information = [
    Information('inStock', '新車種の入荷①', '2021/7/20', '新たに〇〇が入荷致しました。'),
    Information('inspection', '車検のお知らせ①', '2021/7/20', '車検についてお知らせ致します。'),
    Information('inStock', '新車種の入荷②', '2021/7/20', '新たに〇〇が入荷致しました。'),
    Information('inspection', '車検のお知らせ②', '2021/7/20', '車検についてお知らせ致します。'),
    Information('inStock', '新車種の入荷③', '2021/7/20', '新たに〇〇が入荷致しました。'),
  ];
  List<Information> inspectionInformation = [];
  List<Information> inStockInformation = [];

  whereInspectionInformation() {
    inspectionInformation =
        information.where((info) => info.classify == 'inspection').toList();
  }
  whereInStockInformation() {
    inStockInformation =
        information.where((info) => info.classify == 'inStock').toList();
  }
}

class TabInfo {
  String label;
  Widget widget;

  TabInfo(this.label, this.widget);
}

class Information {
  String classify;
  String title;
  String date;
  String description;

  Information(this.classify, this.title, this.date, this.description);
}
