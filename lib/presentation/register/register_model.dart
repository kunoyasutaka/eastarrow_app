import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/question_page/question_page.dart';
import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';

class RegisterModel extends ChangeNotifier {
  final repository = AuthRepository();

  Future<void> onPushSignup(BuildContext context, GlobalKey<FormBuilderState> formKey) async {
    if (await createUser(context, formKey) == null) {
      Logger().e('登録に失敗しました。\n再度登録してください。');
      return;
    }
    await showTextDialog(context, '新規登録に成功しました。');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionPage(mail: formKey.currentState!.fields['mail']!.value)),
    );
  }

  ///auth登録処理
  Future<UserCredential?> createUser(BuildContext context, GlobalKey<FormBuilderState> formKey) async {
    try {
      return await repository.createUserWithEmail(
        context,
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
