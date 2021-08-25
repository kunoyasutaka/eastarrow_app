import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';

class RegisterModel extends ChangeNotifier {
  final formKey = GlobalKey<FormBuilderState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final repository = AuthRepository();

  ///auth登録処理
  Future<UserCredential?> createUser() async {
    try {
      return await repository.createUserWithEmail(
        mailController.text,
        passwordController.text,
        passwordConfirmController.text,
      );
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
