import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyModel extends ChangeNotifier {
  ///必要であれば実装
  // final repository = MemberRepository();
  // late Member member;
  //
  // Future<void> init() async {
  //   member = await repository.fetchMember(FirebaseAuth.instance.currentUser!.uid);
  //   notifyListeners();
  // }
  Future<void> phoneCall() async {
    const phoneURL = "tel:+819018621477";
    if (await canLaunch(phoneURL)) {
      launch(phoneURL);
    } else {
      final Error error = ArgumentError('Could not launch $phoneURL');
      throw error;
    }
  }
}
