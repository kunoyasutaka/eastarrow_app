import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/root.dart';
import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';

class LoginModel extends ChangeNotifier {
  final repository = AuthRepository();

  Future<void> onPushLogin(context, GlobalKey<FormBuilderState> formKey) async {
    if (await login(context, formKey) == null) {
      Logger().e('ログインに失敗しました。');
      return;
    }
    await showTextDialog(context, 'ログインが完了しました。');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Root()),
    );
  }

  Future<UserCredential?> login(BuildContext context, GlobalKey<FormBuilderState> formKey) async {
    try {
      return await repository.signIn(context,
          formKey.currentState!.fields['mail']!.value, formKey.currentState!.fields['password']!.value);
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
