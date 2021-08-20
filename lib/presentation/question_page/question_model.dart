import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/repository/member_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class QuestionModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final birthdateController = TextEditingController();
  final locationController = TextEditingController();
  final inspectionController = TextEditingController();
  final carTypeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final repository = MemberRepository();
  late Member member;

  Future<void> selectBirthday(BuildContext context) async {
    final selectedBirthday = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
    );
    if (selectedBirthday != null) {
      birthdateController.text = '${selectedBirthday.year}年${selectedBirthday.month}月${selectedBirthday.day}日';
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

  ///member入力内容をDBに追加
  Future<void> onPushAddMember(String mail) async {
    createMember(mail);
    await repository.addMember(member);
    notifyListeners();
  }

  ///入力内容をMemberにする
  void createMember(String mail) {
    member = Member(
      name: nameController.text,
      email: mail,
      location: locationController.text,
      phoneNumber: phoneNumberController.text,
      birthDate: birthdateController.text,
      carType: carTypeController.text,
      inspectionDay: inspectionController.text,
    );
    notifyListeners();
  }
}
