import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/repository/member_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final repository = MemberRepository();
  late Member _member;

  Future<void> init() async {
    await fetchMember();

    /// DBがNullだった場合、空文字を返すようにUserモデルでケアしているため!で代入
    nameController.text = _member.name!;
    mailController.text = _member.email!;
    birthdayController.text = _member.birthDate!;
    locationController.text = _member.location!;
    phoneNumberController.text = _member.phoneNumber!;
    carTypeController.text = _member.carType!;
    inspectionController.text = _member.inspectionDay!;
  }


  Future<void> fetchMember() async {
    _member = await repository.fetchMember(FirebaseAuth.instance.currentUser!.uid);
  }

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


}
