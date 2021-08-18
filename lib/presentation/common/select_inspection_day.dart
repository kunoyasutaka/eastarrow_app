import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

Future<void> selectInspectionDay(BuildContext context,TextEditingController inspectionController) async {
  final selectedInspectionDay = await DatePicker.showDatePicker(
    context,
    showTitleActions: true,
    minTime: DateTime(2000, 1, 1),
    maxTime: DateTime.now(),
  );
  if (selectedInspectionDay != null) {
    inspectionController.text =
    '${selectedInspectionDay.year}年${selectedInspectionDay.month}月${selectedInspectionDay.day}日';
  }
}