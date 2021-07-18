import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyPageModel extends ChangeNotifier {
  final String initialName = '久野';

  final nameController = TextEditingController(text: '関 純一'); //TODO DBのname
  final mailController = TextEditingController(text: 'mail'); //TODO DBのmail
  final birthdayController = TextEditingController(text: '生年月日を入力してください'); //TODO DBのbirthday
  final addressController = TextEditingController(text: '阿久比'); //TODO DBのaddress
  final phoneNumberController =
      TextEditingController(text: '090xxxxxxxx'); //TODO DBのphone
  DateTime? birthday;


  Future selectedDate(context) async {
    //TODO ↓カレンダーから選択バージョン
    // final selectedBirthday = await showDatePicker(
    //   context:context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(1900, 1, 1),
    //   lastDate: DateTime.now(),
    // );

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
