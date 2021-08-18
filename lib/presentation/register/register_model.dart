import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegisterModel extends ChangeNotifier {
  String mail = '';
  String password = '';
  String passwordConfirm = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///auth登録処理
  ///TODO バリデーション：mail,pass未入力時・同じmail登録時・passと確認用が異なる場合
  Future<void> addAuth() async {
    // if (mail.isEmpty) {
    //   throw ('メールアドレスを入力してください');
    // }
    // if (password.isEmpty) {
    //   throw ('パスワードを入力してください');
    // }
    // if (passwordConfirm.isEmpty) {
    //   throw ('確認用パスワードを入力してください');
    // }

    try {
      await _auth.createUserWithEmailAndPassword(email: mail, password: password);
      notifyListeners();
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
