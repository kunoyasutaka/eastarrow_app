import 'package:eastarrow_app/domain/accident.dart';
import 'package:eastarrow_app/repository/accident_repository.dart';
import 'package:flutter/material.dart';

class AccidentModel extends ChangeNotifier {
  final policyNumberController = TextEditingController();
  final carDamageController = TextEditingController();
  final injuryController = TextEditingController();
  final opponentController = TextEditingController();
  final accidentSituationController = TextEditingController();

  final repository = AccidentRepository();
  late Accident _accident;

  Future<void> onPushSendAccident() async {
    _accident = createAccident();
    await repository.accidentToFirestore(_accident);
    notifyListeners();
  }

  Accident createAccident() {
    return Accident(
      policyNumber: policyNumberController.text,
      carDamage: carDamageController.text,
      injury: injuryController.text,
      opponent: opponentController.text,
      accidentSituation: accidentSituationController.text,
    );
  }
}
