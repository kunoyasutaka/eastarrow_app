import 'package:eastarrow_app/domain/infomation.dart';
import 'package:eastarrow_app/presentation/common/drawer.dart';
import 'package:eastarrow_app/presentation/information/information_tab/information_all_page.dart';
import 'package:eastarrow_app/presentation/information/information_tab/information_inspection_page.dart';
import 'package:eastarrow_app/presentation/information/information_tab/information_instock_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'information_model.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InformationModel(),
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
              ),
              endDrawer: drawer(),
              body: const TabBarView(
                children: [
                  InformationAllPage(),
                  InformationInStockPage(),
                  InformationInspectionPage(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
