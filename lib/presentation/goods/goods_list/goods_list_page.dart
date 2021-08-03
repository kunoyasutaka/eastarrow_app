import 'package:eastarrow_app/presentation/common/drawer.dart';
import 'package:eastarrow_app/presentation/goods/goods_detail/goods_detail_page.dart';
import 'package:eastarrow_app/presentation/goods/goods_list/goods_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoodsListPage extends StatelessWidget {
  const GoodsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoodsListModel()..init(),
      child: Consumer<GoodsListModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('入荷情報'),
              centerTitle: true,
            ),
            endDrawer: drawer(),
            body: RefreshIndicator(
              onRefresh: () async => await model.fetchGoodsList(),
              child: ListView.builder(
                itemCount: model.goodsList.length,
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
                                      goods: model.goodsList[index],
                                    ),
                                fullscreenDialog: true),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey, width: 1))),
                              child: Text(
                                model.goodsList[index].name!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12, top: 12),
                              child: Text(
                                model.goodsList[index].introduction!,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Image.network(
                                    model.goodsList[index].imageUrl!.first),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${model.goodsList[index].bodyValue!}万円',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
