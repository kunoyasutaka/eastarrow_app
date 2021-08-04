import 'package:eastarrow_app/presentation/information/information_model.dart';
import 'package:eastarrow_app/presentation/information/information_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationInStockPage extends StatelessWidget {
  const InformationInStockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InformationModel()..whereInStockInformation(),
      child: Consumer<InformationModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async => await model.fetchInfoData(),
              child: ListView.builder(
                itemCount: model.inStockInformationList.length,
                itemBuilder: (BuildContext context, int index) {
                  return const InformationPage().informationTile(model.inStockInformationList[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
