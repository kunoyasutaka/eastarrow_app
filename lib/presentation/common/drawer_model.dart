import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerModel extends ChangeNotifier {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
