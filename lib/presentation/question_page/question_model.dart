import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class QuestionModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final birthdayController = TextEditingController();
  final addressController = TextEditingController();
  final inspectionController = TextEditingController();
  final vehicleTypeController = TextEditingController();
  final phoneNumberController = TextEditingController();

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
