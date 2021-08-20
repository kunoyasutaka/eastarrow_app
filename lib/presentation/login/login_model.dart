import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginModel extends ChangeNotifier {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<UserCredential?> login() async {
    // if (mail.isEmpty) {
    //   throw ('メールアドレスを入力してください');
    // }
    // if (password.isEmpty) {
    //   throw ('パスワードを入力してください');
    // }

    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
