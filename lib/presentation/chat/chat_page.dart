import 'package:eastarrow_app/domain/user.dart';
import 'package:eastarrow_app/presentation/chat/chat_detail/chat_detail_page.dart';
import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/common/drawer.dart';
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
                onRefresh: () async => await model.fetchChatTitle('ZIMFU3g9CuQxuXJMFi1L'),
                child: Column(
                  children: [
                    ///仮で表示
                    Expanded(
                      child: ListView.builder(
                          itemCount: model.chatTitleList.length,
                          itemBuilder: (BuildContext context, int logIndex) {
                            return InkWell(
                              onTap: () async {
                                await model.fetchChatDetail(model.chatTitleList[logIndex][ChatTitleField.docId]);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatDetailPage(
                                            chatTitle: model.chatTitleList[logIndex],
                                            chatDetailList: model.chatDetailList,
                                          ),
                                      fullscreenDialog: true),
                                );
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.grey, width: 1),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '件名：${model.chatTitleList[logIndex][ChatTitleField.title]}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                          onPressed: () => model.titleController.text =
                                              model.chatTitleList[logIndex][ChatTitleField.title],
                                          icon: const Icon(Icons.reply)),
                                    ],
                                  )),
                            );
                          }),
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
                                  decoration: const InputDecoration(hintText: '件名'),
                                  keyboardType: TextInputType.text,
                                  controller: model.titleController,
                                ),
                              ),
                              IconButton(
                                onPressed: () async => await showTextDialog(context, '画像を選択してください。'),
                                icon: const Icon(Icons.image),
                              ),
                              //TODO ImagePickerでファイルを取得
                              IconButton(
                                onPressed: () async => await showTextDialog(context, '写真を撮影してください。'),
                                icon: const Icon(Icons.camera_alt),
                              ),
                              //TODO カメラを開く
                              IconButton(
                                onPressed: () async {
                                  await showTextDialog(context, 'まだ編集中です。');
                                },                                icon: const Icon(Icons.send),
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
