import 'package:eastarrow_app/domain/infomation.dart';
import 'package:eastarrow_app/presentation/common/time_format.dart';
import 'package:flutter/material.dart';

Widget informationTile(Information information) {
  return ExpansionTile(
    subtitle: Text('更新日：${timeFormat(information.createdAt!)}',
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
    title: Text(
      information.title!,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    tilePadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(information.body!),
            information.imageUrl != ''
                ? Container(padding: const EdgeInsets.only(top: 16), child: Image.network(information.imageUrl!))
                : const SizedBox(),
          ],
        ),
      )
    ],
  );
}