import 'package:flutter/material.dart';

Widget drawerTile(IconData icon, String text) {
  return ListTile(
    leading: Icon(icon, size: 28),
    title: Text(text, style: const TextStyle(fontSize: 16)),
  );
}