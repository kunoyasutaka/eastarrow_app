import 'package:eastarrow_app/presentation/goods/goods_detail/goods_detail_page.dart';
import 'package:eastarrow_app/presentation/goods/goods_list/goods_list_model.dart';
import 'package:eastarrow_app/presentation/my/my_page.dart';
import 'package:eastarrow_app/theme/app_colors.dart';
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
            endDrawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.navyBlue,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('会員情報の変更'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('ホームページはこちら'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text('ご利用規約'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('プライバシーポリシー'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
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
                              model.goodsName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 12),
                            child: Text(
                              model.introduction,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 16),
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
