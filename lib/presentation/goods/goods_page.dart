import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastarrow_app/presentation/admission/emergency_page.dart';
import 'package:eastarrow_app/presentation/chat/chat_page.dart';
import 'package:eastarrow_app/presentation/goods/goods_model.dart';
import 'package:eastarrow_app/presentation/my/my_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoodsPage extends StatelessWidget {
  const GoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoodsModel(),
      child: Consumer<GoodsModel>(
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
                      ],
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
