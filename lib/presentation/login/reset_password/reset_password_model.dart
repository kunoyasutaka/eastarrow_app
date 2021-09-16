import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';

class ResetPasswordModel extends ChangeNotifier {
  final formKey = GlobalKey<FormBuilderState>();
  final mailController = TextEditingController();
  final repository = AuthRepository();
  String errorMessage = '';

  Future<String> resetPassword() async {
    try {
      await repository.sendPasswordResetEmail(mailController.text);
      return 'success';
    } on MyAuthException catch (e) {
      Logger().e(e.toString());
      errorMessage = e.message.toString();
      notifyListeners();
      return e.toString();
    } catch (e) {
      Logger().e(e.toString());
      errorMessage = e.toString();
      notifyListeners();
      return e.toString();
    }
  }
}
