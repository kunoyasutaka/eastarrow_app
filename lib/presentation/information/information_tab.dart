import 'package:eastarrow_app/domain/infomation.dart';
import 'package:eastarrow_app/presentation/information/information_tile.dart';
import 'package:flutter/material.dart';

Widget informationTab(List<Information> informationList) {
  return Scaffold(
    body: ListView.builder(
      itemCount: informationList.length,
      itemBuilder: (BuildContext context, int index) {
        return informationTile(informationList[index]);
      },
    ),
  );
}
