import 'dart:io';

import 'package:flutter/material.dart';

///選択したimageをグレーのエリアに表示
///TODO 最大表示上限・選択解除の機能
Widget selectImageArea(List<File> imageList){
  return Container(
    height: 80,
    width: double.infinity,
    color: Colors.grey.withOpacity(0.3),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.file(imageList[index]),
          );
        },
      ),
    ),
  );
}