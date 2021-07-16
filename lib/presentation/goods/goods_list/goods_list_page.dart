import 'package:eastarrow_app/presentation/goods/goods_list/goods_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoodsListPage extends StatelessWidget {
  const GoodsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoodsListModel(),
      child: Consumer<GoodsListModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('入荷情報'),
              centerTitle: true,
            ),
            endDrawer: Drawer(),
            body: ListView.builder(
              itemCount: model.imgList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Image.network(model.imgList[index]),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '130万円',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'メルセデス・ベンツ 190クラス',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text('年式 2011 (H23)'),
                          const SizedBox(height: 8),
                          const Text('走行距離 7.5万km'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
