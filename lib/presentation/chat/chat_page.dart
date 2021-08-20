import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/presentation/chat/chat_detail/chat_detail_page.dart';
import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/common/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatModel()..init(),
      child: Consumer<ChatModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('連絡'),
              centerTitle: true,
            ),
            endDrawer: drawer(),
            body: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: RefreshIndicator(
                onRefresh: () async => await model
                    .fetchChatTitle(FirebaseAuth.instance.currentUser!.uid),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: model.chatTitleList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatDetailPage(
                                          chatTitle: model.chatTitleList[index],
                                        ),
                                    fullscreenDialog: true),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              height: 60,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: const Text('件名',
                                        style: TextStyle(fontSize: 16)),
                                    padding: const EdgeInsets.only(right: 16),
                                  ),
                                  Expanded(
                                    child: Text(
                                      model.chatTitleList[index]
                                          [ChatTitleField.title],
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  decoration:
                                      const InputDecoration(hintText: '件名'),
                                  keyboardType: TextInputType.text,
                                  controller: model.titleController,
                                ),
                              ),
                              IconButton(
                                onPressed: () async => await showTextDialog(
                                    context, '画像を選択してください。'),
                                icon: const Icon(Icons.image),
                              ),
                              //TODO ImagePickerでファイルを取得
                              IconButton(
                                onPressed: () async => await showTextDialog(
                                    context, '写真を撮影してください。'),
                                icon: const Icon(Icons.camera_alt),
                              ),
                              //TODO カメラを開く
                              IconButton(
                                onPressed: () async {
                                  await showConfirmDialog(context,
                                          'ご記入いただいた内容を送信します。\nよろしいですか？')
                                      ? {
                                          await model.onPushSendNewChat(
                                              model.chatTitleList,
                                              FirebaseAuth
                                                  .instance.currentUser!.uid),
                                          await showTextDialog(
                                              context, '送信しました。'),
                                          await model.fetchChatTitle(
                                              FirebaseAuth
                                                  .instance.currentUser!.uid),
                                        }
                                      : null;
                                },
                                icon: const Icon(Icons.send),
                              ), //TODO 送信処理
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: '本文',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            controller: model.bodyController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
