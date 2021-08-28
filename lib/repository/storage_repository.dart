import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class StorageRepository {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  ///imageFileをStorageに入れて返ったimageUrlをimageUrlListにURLを追加
  ///imageFileが選択された後に呼ばれる
  Future<List<String?>> uploadImage(List<File> imageList) async {
    try {
      List<String?>? _storageUpdate = await uploadImageToStorage(imageList);
      if (_storageUpdate == null) {
        return [];
      }
      List<String?> _imageUrlList = _storageUpdate;
      return _imageUrlList;
    } on FirebaseException catch (e) {
      Logger().e(e.toString());
      return [];
    } catch (e) {
      Logger().e(e.toString());
      return [];
    }
  }

  ///todo Storageへのアップロード
  Future<List<String?>?> uploadImageToStorage(List<File> imageList) async {
    try {
      List<String?> _downloadUrlList = [];
      _downloadUrlList = await Future.wait(imageList.map((e) async {
        firebase_storage.Reference _ref =
            storage.ref().child('chat/${FirebaseAuth.instance.currentUser!.uid}/${basename(e.path)}');
        TaskSnapshot _snapshot = await _ref.putFile(e);
        String _downloadUrl = await _snapshot.ref.getDownloadURL();
        return _downloadUrl;
      }).toList());
      return _downloadUrlList;
    } on FirebaseException catch (e) {
      Logger().e(e.toString());
      return null;
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
