import 'package:eastarrow_app/presentation/login/login_page.dart';
import 'package:eastarrow_app/presentation/root.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiscriminationPage extends StatelessWidget {
  const DiscriminationPage({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (AuthRepository().isSignIn) {
      return const Root();
    } else {
      return const LoginPage();
    }
  }
}