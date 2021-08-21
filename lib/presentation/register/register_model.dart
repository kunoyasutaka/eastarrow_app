import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/question_page/question_page.dart';
import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';

class RegisterModel extends ChangeNotifier {
  final repository = AuthRepository();

  Future<void> onPushSignup(context, GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState!.validate()){
      if (await createUser(formKey) == null) {
        Logger().e('登録に失敗しました。\n再度登録してください。');
        return;
      }
      await showTextDialog(context, '新規登録に成功しました。');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuestionPage(mail: formKey.currentState!.fields['mail']!.value)),
      );
    }
  }

  ///auth登録処理
  Future<UserCredential?> createUser(GlobalKey<FormBuilderState> formKey) async {
    try {
      return await repository.createUserWithEmail(
        formKey.currentState!.fields['mail']!.value,
        formKey.currentState!.fields['password']!.value,
      );
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
