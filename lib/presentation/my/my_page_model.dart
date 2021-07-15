import 'package:flutter/material.dart';

class MyPageModel extends ChangeNotifier {
  final String initialName = '久野';

  final nameController = TextEditingController(text: '久野');
}
