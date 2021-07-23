import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyPageModel extends ChangeNotifier {
  final nameController = TextEditingController(text: '関 純一'); //TODO DBのname
  final mailController = TextEditingController(text: 'mail'); //TODO DBのmail
  final birthdayController =
      TextEditingController(text: '生年月日を入力してください'); //TODO DBのbirthday
  final addressController =
      TextEditingController(text: '阿久比'); //TODO DBのaddress
  final inspectionController =
      TextEditingController(text: '車検日を入力してください'); //TODO DBのinspectionDay
  final vehicleTypeController =
      TextEditingController(text: 'ホンダ　ライフ'); //TODO DBのvehicleType
  final phoneNumberController =
      TextEditingController(text: '090xxxxxxxx'); //TODO DBのphone

  Future<void> selectBirthday(BuildContext context) async {
    final selectedBirthday = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
    );
    if (selectedBirthday != null) {
      birthdayController.text =
          '${selectedBirthday.year}年${selectedBirthday.month}月${selectedBirthday.day}日';
    }
    notifyListeners();
  }

  Future<void> selectInspectionDay(BuildContext context) async {
    final selectedInspectionDay = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000, 1, 1),
      maxTime: DateTime.now(),
    );
    if (selectedInspectionDay != null) {
      inspectionController.text =
          '${selectedInspectionDay.year}年${selectedInspectionDay.month}月${selectedInspectionDay.day}日';
    }
    notifyListeners();
  }
}
