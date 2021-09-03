import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

class StorageRepository {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  ///imageFileをStorageに入れて返ったimageUrlをimageUrlListにURLを追加
  ///imageFileが選択された後に呼ばれる
  Future<String> uploadImage(File imageFile, String path) async {
    try {
      firebase_storage.SettableMetadata _metadata = firebase_storage.SettableMetadata(contentType: 'image/png');
        TaskSnapshot _snapshot = await storage
            .ref(path)
            .putFile(imageFile, _metadata);
        return await _snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      Logger().e(e.toString());
      return '';
    } catch (e) {
      Logger().e(e.toString());
      return '';
    }
  }

  ///元コード
  Future<List<String>> uploadImageTo(List<File> imageList) async {
    try {
      List<String> _downloadUrlList = [];
      _downloadUrlList = await Future.wait(imageList.map((e) async {
        TaskSnapshot _snapshot = await storage
            .ref()
            .child('chat/${FirebaseAuth.instance.currentUser!.uid}/${DateTime.now().toString()}.png')
            .putFile(e, firebase_storage.SettableMetadata(contentType: 'image/png'));
        String _downloadUrl = await _snapshot.ref.getDownloadURL();
        return _downloadUrl;
      }).toList());
      return _downloadUrlList;
    } on FirebaseException catch (e) {
      Logger().e(e.toString());
      return [];
    } catch (e) {
      Logger().e(e.toString());
      return [];
    }
  }
}
