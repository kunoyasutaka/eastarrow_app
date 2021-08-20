import 'package:eastarrow_app/domain/repair.dart';
import 'package:eastarrow_app/repository/repair_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RepairModel extends ChangeNotifier {
  final carMakerController = TextEditingController();
  final carTypeController = TextEditingController();
  final inspectionExpirationController = TextEditingController();
  final inquiryController = TextEditingController();
  final remarkController = TextEditingController();

  final repository = RepairRepository();
  late Repair _repair;

  Future<void> onPushSendRepair() async {
    _repair = createRepair();
    await repository.addRepair(_repair, FirebaseAuth.instance.currentUser!.uid);
    notifyListeners();
  }

  Repair createRepair() {
    return Repair(
      carMaker: carMakerController.text,
      carType: carTypeController.text,
      inspectionExpiration: inspectionExpirationController.text,
      inquiry: inquiryController.text,
      remark: remarkController.text,
    );
  }
}
