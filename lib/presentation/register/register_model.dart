import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';

class RegisterModel extends ChangeNotifier {
  final formKey = GlobalKey<FormBuilderState>();
  final repository = AuthRepository();

  ///auth登録処理
  Future<UserCredential?> createUser() async {
    try {
      return await repository.createUserWithEmail(
        formKey.currentState!.fields['mail']!.value,
        formKey.currentState!.fields['password']!.value,
        formKey.currentState!.fields['passwordConfirm']!.value,
      );
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
