import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/chatdetail.dart';
import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/repository/chat_repository.dart';
import 'package:eastarrow_app/repository/member_repository.dart';
import 'package:eastarrow_app/repository/storage_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class ChatModel extends ChangeNotifier {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final memberRepository = MemberRepository();
  final chatRepository = ChatRepository();
  final storageRepository = StorageRepository();
  late Member _member;
  List<Map> chatTitleList = [];

  ///画像選択時にリスト化
  List<String> selectImageUrl = [];
  late Map chatDetail;
  List<Map> chatDetailList = [];
  File? imageFile;
  List<File> imageList = [];
  List<String?> imageUrlList = [];

  Future<void> init() async {
    await fetchChatTitle(FirebaseAuth.instance.currentUser!.uid);
    notifyListeners();
  }

  ///memberのdocを呼んでchatTitleListにList<Map>を入れる
  Future<void> fetchChatTitle(String userId) async {
    _member = await memberRepository.fetchMember(userId);
    chatTitleList = _member.chatTitle ?? [];
    notifyListeners();
  }

  ///chat入力内容をListに入れてDB(chatDetail)を更新
  Future<void> onPushSendNewChat(List<Map> chatTitleList, String userId) async {
    // await uploadImage();
    if (imageList != []) {
      imageUrlList = (await storageRepository.uploadImageToStorage(imageList, titleController.text, bodyController.text))!;
    }
    createChatDetailList(userId);
    await chatRepository.addChat(chatDetailList, chatTitleList, titleController.text, userId);
    resetChatDetail();
    notifyListeners();
  }

  ///chatの入力内容を空のchatDetailListにMap型で入れる
  void createChatDetailList(String userId) {
    chatDetail = {
      ChatDetailField.body: bodyController.text,
      ChatDetailField.imageUrl: imageUrlList,

      ///senderの表示をどうするか。仮でUIDを登録
      ChatDetailField.sender: userId,
      ChatDetailField.createdAt: Timestamp.fromDate(DateTime.now()),
    };
    chatDetailList.add(chatDetail);
    notifyListeners();
  }

  ///本文と選択画像をリセット
  void resetChatDetail() {
    titleController.text = '';
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

}
