import 'package:eastarrow_app/presentation/information/information_model.dart';
import 'package:eastarrow_app/presentation/information/information_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationAllPage extends StatelessWidget {
  const InformationAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InformationModel(),
      child: Consumer<InformationModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: ListView.builder(
              itemCount: model.information.length,
              itemBuilder: (BuildContext context, int index) {
                return const InformationPage().informationTile(model.information[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
