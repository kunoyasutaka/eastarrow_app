import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';

class ResetPasswordModel extends ChangeNotifier {
  final formKey = GlobalKey<FormBuilderState>();
  final mailController = TextEditingController();
  final repository = AuthRepository();

  Future<bool> resetPassword() async {
    try {
      await repository.sendPasswordResetEmail(mailController.text);
      return true;
    } on MyAuthException catch (e) {
      Logger().e(e.toString());
      return false;
    } catch (e) {
      Logger().e(e.toString());
      return false;
    }
  }
}
