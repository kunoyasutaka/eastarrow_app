import 'dart:io';

import 'package:flutter/material.dart';

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