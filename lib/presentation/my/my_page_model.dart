import 'package:eastarrow_app/domain/user.dart';
import 'package:eastarrow_app/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyPageModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final birthdayController = TextEditingController();
  final locationController = TextEditingController();
  final inspectionController = TextEditingController();
  final carTypeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final repository = UserRepository();
  late User user;

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

  Future<void> fetchUser() async {
    // TODO auth処理が完成するまでの暫定定義
    const userId = 'ZIMFU3g9CuQxuXJMFi1L';
    user = await repository.fetchUser(userId);
  }

  Future<void> init() async {
    await fetchUser();

    /// DBがNullだった場合、空文字を返すようにUserモデルでケアしているため!で代入
    nameController.text = user.name!;
    mailController.text = user.email!;
    birthdayController.text = user.birthDate!;
    locationController.text = user.location!;
    phoneNumberController.text = user.phoneNumber!;
    carTypeController.text = user.carType!;
    inspectionController.text = user.inspectionDay!;
  }
}
