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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    items: createImageSliders(model.imgList),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        model.pageChanged(index);
                      },
                    ),
                  ),
                  ImageSliderIndicator(
                    imageList: model.imgList,
                    currentNumber: model.sliderIndex,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _pageTransitionPanelWidget({
    required BuildContext context,
    required String title,
    required Color color,
    required Widget page,
  }) {
    return GestureDetector(
      child: Container(
        width: 150,
        height: 100,
        color: color,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  List<Widget> createImageSliders(List<String> imgList) {
    return imgList.map((item) {
      return Image.network(item);
    }).toList();
  }
}

//画像の下部に位置し、現在の画像が何番目の画像かを示すclass
//TODO: 別ファイルで管理することを検討
class ImageSliderIndicator extends StatelessWidget {
  const ImageSliderIndicator({
    Key? key,
    required this.imageList,
    required this.currentNumber,
  }) : super(key: key);

  final List? imageList;
  final int? currentNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageList!.map((e) {
        final int index = imageList!.indexOf(e);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentNumber == index
                ? const Color.fromRGBO(0, 0, 0, 0.9)
                : const Color.fromRGBO(0, 0, 0, 0.4),
          ),
        );
      }).toList(),
    );
  }
}
