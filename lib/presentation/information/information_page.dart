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
        builder: (context, model, snapshot) {
          return DefaultTabController(
            length: model.tabInfo.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('お知らせ'),
                centerTitle: true,
                bottom: TabBar(
                  tabs: model.tabInfo.map((TabInfo tabInfo) {
                    return Tab(
                      text: tabInfo.label,
                    );
                  }).toList(),
                ),
              ),
              endDrawer: const Drawer(),
              body: TabBarView(
                children: model.tabInfo
                    .map((TabInfo tabInfo) => tabInfo.widget)
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  informationTile(Information information) {
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
