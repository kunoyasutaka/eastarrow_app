import 'package:eastarrow_app/domain/infomation.dart';
import 'package:eastarrow_app/presentation/common/drawer.dart';
import 'information_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'information_model.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InformationModel()..init(),
      child: Consumer<InformationModel>(
        builder: (context, model, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('お知らせ'),
                centerTitle: true,
                bottom: const TabBar(
                  tabs: [
                    Tab(text: InformationTab.all),
                    Tab(text: InformationTab.inStock),
                    Tab(text: InformationTab.inspection),
                  ],
                ),
                leading: IconButton(
                    onPressed: () async => await model.fetchInfoData(),
                    icon: const Icon(Icons.refresh)),
              ),
              endDrawer: const DrawerList(),
              body: TabBarView(
                children: [
                  informationTab(model.informationList),
                  informationTab(model.inStockList),
                  informationTab(model.inspectionList),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
