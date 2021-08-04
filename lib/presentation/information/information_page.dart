import 'package:eastarrow_app/domain/infomation.dart';
import 'package:eastarrow_app/presentation/common/drawer.dart';
import 'package:eastarrow_app/presentation/common/time_format.dart';
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

  Widget informationTile(Information information) {
    return ExpansionTile(
      subtitle: Text('更新日：${timeFormat(information.createdAt!)}',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
      title: Text(
        information.title!,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      tilePadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(information.body!),
              information.imageUrl != ''
                  ? Container(padding: const EdgeInsets.only(top: 16), child: Image.network(information.imageUrl!))
                  : const SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
