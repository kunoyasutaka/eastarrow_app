import 'package:eastarrow_app/presentation/information/information_model.dart';
import 'package:eastarrow_app/presentation/information/information_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationInspectionPage extends StatelessWidget {
  const InformationInspectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InformationModel()..whereInspectionInformation(),
      child: Consumer<InformationModel>(
        builder: (context, model, snapshot) {
          return Scaffold(
            body: ListView.builder(
              itemCount: model.inspectionInformation.length,
              itemBuilder: (BuildContext context, int index) {
                  return const InformationPage()
                      .informationTile(model.inspectionInformation[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
