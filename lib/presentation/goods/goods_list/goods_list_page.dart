import 'package:eastarrow_app/presentation/goods/goods_detail/goods_detail_page.dart';
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GoodsDetailPage(
                              url: model.imgList[index],
                              name: model.goodsName,
                              introduction: model.introduction,
                            ),
                          ),
                        );
                      },
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
                          Text(
                            model.goodsName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            model.introduction,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 8),
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
