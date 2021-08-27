import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/chat.dart';
import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/repository/chat_repository.dart';
import 'package:eastarrow_app/repository/storage_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:logger/logger.dart';

class ChatDetailModel extends ChangeNotifier {
  final chatRepository = ChatRepository();
  final storageRepository = StorageRepository();
  final bodyController = TextEditingController();
  List<Map> chatDetailList = [];
  late Chat chat;
  late Map chatDetail;
  File? imageFile;
  List<File> imageList = [];
  List<String?> imageUrlList = [];

  Future<void> init(Map chatTitle) async {
    await fetchChat(chatTitle[ChatTitleField.docId]);
    notifyListeners();
  }

  ///chatのdocを呼んでchatDetail<Map>をリストに入れる
  Future<void> fetchChat(String docId) async {
    chat = await chatRepository.fetchChat(docId);
    chatDetailList = chat.chatDetail!;
    notifyListeners();
  }

  ///chat入力内容をListに入れてDB(chatDetail)を更新
  Future<void> onPushSendChatDetail(Map chatTitle) async {
    await uploadImage();
    createChatDetail();
    chatDetailList.add(chatDetail);
    await chatRepository.updateChat(chatDetailList, chatTitle);
    resetChatDetail();
    notifyListeners();
  }

  ///chatの入力内容をMap型で返す
  void createChatDetail() {
    chatDetail = {
      'body': bodyController.text,
      'imageUrl': imageUrlList,

      ///senderの表示をどうするか。仮でUIDを登録
      'sender': FirebaseAuth.instance.currentUser!.uid,
      'createdAt': Timestamp.fromDate(DateTime.now()),
    };
    notifyListeners();
  }

  ///本文と選択画像をリセット
  void resetChatDetail() {
    bodyController.text = '';
    imageList = [];
    imageUrlList = [];
    imageFile = null;
    notifyListeners();
  }

  ///imagePickerを起動
  Future<void> showImagePicker(BuildContext context) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        imageList.add(imageFile!);
        notifyListeners();
      } else {
        return;
      }
    } catch (e) {
      Logger().e(e.toString());
      return;
    }
  }

  ///imageFileをStorageに入れて返ったimageUrlをimageUrlListにURLを追加
  ///imageFileが選択された後に呼ばれる
  Future<void> uploadImage() async {
    try {
      final _storageUpdate = await storageRepository.uploadImageToStorage(imageList, bodyController.text);
      if (_storageUpdate == null) {
        return;
      }
      imageUrlList = _storageUpdate;
      notifyListeners();
    } on FirebaseException catch (e) {
      Logger().e(e.toString());
      return;
    } catch (e) {
      Logger().e(e.toString());
      return;
    }
  }
}
