import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class MyPageModel extends ChangeNotifier {
  final String initialName = '久野';

  final nameController = TextEditingController(text: '関 純一');
  final mailController = TextEditingController(text: 'mail');
  final birthdayController = TextEditingController(text: '19960108');
  final addressController = TextEditingController(text: '阿久比');
  final telephoneNumberController =
      TextEditingController(text: '090-xxxx-xxxx');

  Future selectedDate(context) async {
    final pickedBirthday = await DatePicker.showDatePicker(
      context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(DateTime.now().year),
    );
    birthdayController.text = DateFormat.yMD().format(pickedBirthday);
  }
}
