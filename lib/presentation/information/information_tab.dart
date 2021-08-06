import 'package:eastarrow_app/domain/infomation.dart';
import 'package:eastarrow_app/presentation/information/information_model.dart';
import 'package:eastarrow_app/presentation/information/information_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationTabPage extends StatelessWidget {
  const InformationTabPage({Key? key, required this.informationList}) : super(key: key);
  final List<Information> informationList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InformationModel(),
      child: Consumer<InformationModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: ListView.builder(
              itemCount: informationList.length,
              itemBuilder: (BuildContext context, int index) {
                return informationTile(informationList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
