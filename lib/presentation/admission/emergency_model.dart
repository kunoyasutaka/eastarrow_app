import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/repository/member_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmergencyModel extends ChangeNotifier {
  final repository = MemberRepository();
  late Member _member;

  Future<void> init() async {
    _member = await repository.fetchMember(FirebaseAuth.instance.currentUser!.uid);
    notifyListeners();
  }
}
