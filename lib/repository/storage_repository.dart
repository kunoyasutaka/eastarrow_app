import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class StorageRepository {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  ///todo Storageへのアップロード
  Future<List<String?>?> uploadImageToStorage(List<File> fileList,String detail) async {
    try {
      List<String?> _downloadUrlList = [];

      await Future.wait(fileList.map((e) async {
        firebase_storage.Reference _ref =
            storage.ref().child('chat/${FirebaseAuth.instance.currentUser!.uid}/$detail/${basename(e.path)}');
        TaskSnapshot _snapshot = await _ref.putFile(e);
        String _downloadUrl = await _snapshot.ref.getDownloadURL();
        _downloadUrlList.add(_downloadUrl);
        // return _downloadUrlList;
      }));
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
