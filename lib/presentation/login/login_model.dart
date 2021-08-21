import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/root.dart';
import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginModel extends ChangeNotifier {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  final repository = AuthRepository();

  Future<void> onPushLogin(context) async {
    if (await login() == null) {
      Logger().e('ログインに失敗しました。');
      return;
    }
    await showTextDialog(context, 'ログインが完了しました。');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Root()),
    );
  }

  Future<UserCredential?> login() async {
    try {
      return await repository.signIn(mailController.text, passwordController.text);
    } on MyAuthException catch (e) {
      Logger().e(e.toString());
      return null;
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
