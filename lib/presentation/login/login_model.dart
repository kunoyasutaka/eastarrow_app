import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  Future login() async {
    if (mail.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: mail,
    //     password: password,
    //   );
    // } catch (e) {
    //   print(e.code);
    //   throw (_convertErrorMessage(e.code));
    // }
  }
}
