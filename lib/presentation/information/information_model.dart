import 'package:eastarrow_app/domain/infomation.dart';
import 'package:eastarrow_app/repository/information_repository.dart';
import 'package:flutter/material.dart';

class InformationModel extends ChangeNotifier {
  final repository = InformationRepository();
  List<Information> informationList = [];
  List<Information> inspectionList = [];
  List<Information> inStockList = [];

  Future<void> init() async {
    await fetchInfoData();
    notifyListeners();
  }

  Future<void> fetchInfoData() async {
    informationList = await repository.fetchInformationList();
    informationList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    inspectionList =
        informationList.where((Information information) => information.classify == InformationTab.inspection).toList();
    inStockList =
        informationList.where((Information information) => information.classify == InformationTab.inStock).toList();
    notifyListeners();
  }
}
