import 'package:eastarrow_app/domain/infomation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget informationTile(Information information) {
  return ExpansionTile(
    title: Text(
      information.title!,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    subtitle: Text((DateFormat('yyyy/MM/dd  HH:mm')).format(information.createdAt!),
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
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
