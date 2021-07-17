import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyPageModel extends ChangeNotifier {
  final String initialName = '久野';

  final nameController = TextEditingController(text: '関 純一');
  final mailController = TextEditingController(text: 'mail');
  final birthdayController = TextEditingController(text: '生年月日を入力してください');
  final addressController = TextEditingController(text: '阿久比');
  final telephoneNumberController =
      TextEditingController(text: '090-xxxx-xxxx');
  DateTime? birthday;

  //TODO ↓カレンダーから選択バージョン
  // Future selectedDate(context) async {
  //   final selectedBirthday = await showDatePicker(context: context,
  //     initialDate: birthday ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),);
  //   birthday = selectedBirthday;
  //   if (birthday == null) return;
  //   if (birthday != null) birthdayController.text ='${birthday?.year}年${birthday?.month}月${birthday?.day}日';
  //   notifyListeners();
  // }

  Future selectedDate(context) async {
    final selectedBirthday = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
    );
    birthday = selectedBirthday;
    if (birthday != null) {
      birthdayController.text =
          '${birthday?.year}年${birthday?.month}月${birthday?.day}日';
    } else {
      return;
    }
    notifyListeners();
  }
}
