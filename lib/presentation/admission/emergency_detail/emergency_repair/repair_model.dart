import 'package:eastarrow_app/domain/repair.dart';
import 'package:eastarrow_app/repository/repair_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RepairModel extends ChangeNotifier {
  final carMakerController = TextEditingController();
  final carTypeController = TextEditingController();
  final inspectionExpirationController = TextEditingController();
  final inquiryController = TextEditingController();
  final remarkController = TextEditingController();

  final repository = RepairRepository();
  late Repair _repair;

  Future<void> onPushSendRepair() async {
    _repair = createRepair();
    await repository.repairToFirestore(_repair);
    notifyListeners();
  }

  Repair createRepair() {
    return Repair(
      carMaker: carMakerController.text,
      carType: carTypeController.text,
      inspectionExpiration: inspectionExpirationController.text,
      inquiry: inquiryController.text,
      remark: remarkController.text,
    );
  }
  Future<void> selectInspectionDay(BuildContext context) async {
    final _selectedInspectionDay = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000, 1, 1),
    );
    if (_selectedInspectionDay != null) {
      inspectionExpirationController.text =
      '${_selectedInspectionDay.year}年${_selectedInspectionDay.month}月${_selectedInspectionDay.day}日';
    }
    notifyListeners();
  }
}