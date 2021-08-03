import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastarrow_app/domain/goods.dart';
import 'package:eastarrow_app/presentation/goods/goods_detail/goods_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoodsDetailPage extends StatelessWidget {
  final Goods goods;

  const GoodsDetailPage({
    Key? key,
    required this.goods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('入荷情報'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => GoodsDetailModel(),
        child: Consumer<GoodsDetailModel>(
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1))),
                      child: Text(
                        goods.name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 12),
                      child: Text(
                        goods.introduction!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CarouselSlider.builder(
                        itemCount: goods.imageUrl!.length,
                        itemBuilder:
                            (BuildContext context, int index, int index2) {
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.network(goods.imageUrl![index]),
                              Container(
                                child: Text(
                                  '${index + 1}/${goods.imageUrl!.length}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 40,
                                height: 28,
                                color: Colors.white,
                                alignment: Alignment.center,
                              ),
                            ],
                          );
                        },
                        options: CarouselOptions(),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      width: double.infinity,
                      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                      child: const Text(
                        '商品の情報',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '本体価格',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    goods.bodyValue!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    '万円',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '支払い総額',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    goods.totalValue!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    '万円',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '年式',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                goods.modelYear!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '走行距離',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                goods.mileage!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '車検有無',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                goods.inspection!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '修理歴',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                goods.repair!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '地域',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                goods.area!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
