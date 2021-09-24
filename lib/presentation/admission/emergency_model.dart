import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyModel extends ChangeNotifier {
 String phoneURL = 'tel:${dotenv.env['PHONE_NUMBER']}';
  Future<void> phoneCall() async {
    if (await canLaunch(phoneURL)) {
      launch(phoneURL);
    } else {
      final Error error = ArgumentError('Could not launch $phoneURL');
      throw error;
    }
  }
}
