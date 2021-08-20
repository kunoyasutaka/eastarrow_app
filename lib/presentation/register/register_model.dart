import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegisterModel extends ChangeNotifier {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final repository = AuthRepository();

  bool checkPassword() {
    return passwordController.text == passwordConfirmController.text;
  }

  ///auth登録処理
  ///TODO バリデーション：mail,pass未入力時・同じmail登録時・passと確認用が異なる場合
  Future<UserCredential?> createUser() async {
    try {
      return await repository.createUserWithEmail(
          mailController.text, passwordController.text);
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
