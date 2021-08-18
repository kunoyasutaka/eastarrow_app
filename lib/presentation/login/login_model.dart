import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  Future login() async {
    // if (mail.isEmpty) {
    //   throw ('メールアドレスを入力してください');
    // }
    // if (password.isEmpty) {
    //   throw ('パスワードを入力してください');
    // }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail,
        password: password,
      );
    } catch (e) {
      Logger().e(e.toString());
    }
  }
}
