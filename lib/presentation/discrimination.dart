import 'package:eastarrow_app/presentation/login/login_page.dart';
import 'package:eastarrow_app/presentation/root.dart';
import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class DiscriminationPage extends StatelessWidget {
  const DiscriminationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (AuthRepository().isSignedIn) {
      return const Root();
    } else {
      return const LoginPage();
    }
  }
}
