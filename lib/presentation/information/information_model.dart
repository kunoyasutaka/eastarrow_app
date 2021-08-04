import 'package:eastarrow_app/domain/infomation.dart';
import 'package:eastarrow_app/repository/information_repository.dart';
import 'package:flutter/material.dart';

class InformationModel extends ChangeNotifier {
  final repository = InformationRepository();
  List<Information> informationList = [];
  List<Information> inspectionInformationList = [];
  List<Information> inStockInformationList = [];

  Future<void> init() async {
    await fetchInfoData();
    notifyListeners();
  }

  Future<void> fetchInfoData() async {
    informationList = await repository.fetchInformationList();
    notifyListeners();
  }

  Future<void> whereInspectionInformation() async {
    informationList = await repository.fetchInformationList();
    inspectionInformationList =
        informationList.where((Information information) => information.classify == '車検情報').toList();
    notifyListeners();
  }

  Future<void> whereInStockInformation() async {
    informationList = await repository.fetchInformationList();
    inStockInformationList =
        informationList.where((Information information) => information.classify == '入荷情報').toList();
    notifyListeners();
  }

}
