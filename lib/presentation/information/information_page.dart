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
                    Tab(text: 'すべて'),
                    Tab(text: '入荷情報'),
                    Tab(text: '車検情報'),
                  ],
                ),
              ),
              endDrawer: const Drawer(),
              body: const TabBarView(
                children: [
                  InformationAllPage(),
                  InformationInspectionPage(),
                  InformationInStockPage(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget informationTile(Information information) {
    return ExpansionTile(
      title: Text('更新日：${information.date}'),
      subtitle: Text('タイトル：${information.title}'),
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('内容：${information.description}'),
        )
      ],
    );
  }
}
