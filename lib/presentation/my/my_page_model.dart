import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/repository/member_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyPageModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final birthdateController = TextEditingController();
  final locationController = TextEditingController();
  final inspectionController = TextEditingController();
  final carTypeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final repository = MemberRepository();
  late Member member;

  Future<void> init() async {
    await fetchMember();

    nameController.text = member.name!;
    mailController.text = member.email!;
    birthdateController.text = member.birthDate!;
    locationController.text = member.location!;
    phoneNumberController.text = member.phoneNumber!;
    carTypeController.text = member.carType!;
    inspectionController.text = member.inspectionDay!;
  }

  ///Authログインしているmember情報を呼ぶ
  Future<void> fetchMember() async {
    member = await repository.fetchMember(FirebaseAuth.instance.currentUser!.uid);
  }

  Future<void> selectBirthday(BuildContext context) async {
    final selectedBirthday = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
    );
    if (selectedBirthday != null) {
      birthdateController.text =
          '${selectedBirthday.year}年${selectedBirthday.month}月${selectedBirthday.day}日';
    }
    notifyListeners();
  }

  ///member入力内容をDBに追加
  ///TODO Authのemailの更新処理（現状はDBのみmailが変わってしまう）
  Future<void> onPushUpdateMember() async {
    createMember();
    await repository.updateMember(member);
    notifyListeners();
  }

  ///入力内容をMember型にする
  void createMember() {
    member = Member(
      name: nameController.text,
      email: mailController.text,
      location: locationController.text,
      phoneNumber: phoneNumberController.text,
      birthDate: birthdateController.text,
      carType: carTypeController.text,
      inspectionDay: inspectionController.text,
    );
    notifyListeners();
  }


}
