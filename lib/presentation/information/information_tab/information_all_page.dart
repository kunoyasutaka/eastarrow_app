import 'package:eastarrow_app/presentation/information/information_model.dart';
import 'package:eastarrow_app/presentation/information/information_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationAllPage extends StatelessWidget {
  const InformationAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InformationModel()..init(),
      child: Consumer<InformationModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async => await model.fetchInfoData(),
              child: ListView.builder(
                itemCount: model.informationList.length,
                itemBuilder: (BuildContext context, int index) {
                  return informationTile(model.informationList[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
