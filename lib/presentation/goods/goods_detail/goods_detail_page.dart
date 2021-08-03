import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastarrow_app/presentation/goods/goods_detail/goods_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoodsDetailPage extends StatelessWidget {
  final String? url;
  final String? name;
  final String? introduction;

  const GoodsDetailPage({
    Key? key,
    this.url,
    this.name,
    this.introduction,
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
                        name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 12),
                      child: Text(
                        introduction!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CarouselSlider.builder(
                        itemCount: model.detailImgList.length,
                        itemBuilder:
                            (BuildContext context, int index, int index2) {
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.network(model.detailImgList[index]),
                              Container(
                                child: Text(
                                  '${index + 1}/${model.detailImgList.length}',
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
                        carouselController: model.carouselController,
                        options: CarouselOptions(
                          autoPlay: true,
                          // enlargeCenterPage: true,
                          // viewportFraction: 0.75,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1))),
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
                              Text(
                                model.bodyValueString,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    model.bodyValue,
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
                              Text(
                                model.totalValueString,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    model.totalValue,
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
                                model.year,
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
                                model.mileage,
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
                                model.checkYear,
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
                                model.repair,
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
                                model.location,
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
