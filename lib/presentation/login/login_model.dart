import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginModel extends ChangeNotifier {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  final repository = AuthRepository();

  Future<UserCredential?> login() async {
    try {
      return await repository.signIn(
          mailController.text, passwordController.text);
    } on MyAuthException catch (e) {
      Logger().e(e.toString());
      return null;
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
