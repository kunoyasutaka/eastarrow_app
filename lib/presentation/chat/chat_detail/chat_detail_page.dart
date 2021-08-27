import 'package:eastarrow_app/domain/chatdetail.dart';
import 'package:eastarrow_app/domain/member.dart';
import 'package:eastarrow_app/presentation/chat/chat_detail/chat_detail_model.dart';
import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatDetailPage extends StatelessWidget {
  final Map chatTitle;

  const ChatDetailPage({
    Key? key,
    required this.chatTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatDetailModel()..init(chatTitle),
      child: Consumer<ChatDetailModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(chatTitle[ChatTitleField.title]),
              centerTitle: true,
            ),
            body: RefreshIndicator(
              onRefresh: () async => await model.fetchChat(chatTitle[ChatTitleField.docId]),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: model.chatDetailList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade400, width: 1),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    model.chatDetailList[index][ChatDetailField.sender] == '管理者'
                                        ? const Icon(Icons.mail, size: 20)
                                        : const Icon(Icons.person, size: 20),
                                    const SizedBox(width: 12),
                                    const Text('ユーザー'),
                                    const Expanded(child: SizedBox()),
                                    Text((DateFormat('yyyy/MM/dd  HH:mm'))
                                        .format(model.chatDetailList[index][ChatDetailField.createdAt].toDate()))
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(model.chatDetailList[index][ChatDetailField.body]),
                                ),
                                model.chatDetailList[index][ChatDetailField.imageUrl].isNotEmpty
                                    ? ListView.builder(
                                        itemCount: model.chatDetailList[index][ChatDetailField.imageUrl].length,
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, imageIndex) {
                                          return Container(
                                            padding: const EdgeInsets.all(12),
                                            child: Image.network(
                                              model.chatDetailList[index][ChatDetailField.imageUrl][imageIndex],
                                              // width: double.infinity,
                                            ),
                                          );
                                        },
                                      )
                                    : Container(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (model.imageFile != null)
                      Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Image.file(model.imageList[index]),
                              );
                            },
                          ),
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () async => await model.showImagePicker(context),
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
                                  await showConfirmDialog(context, 'ご記入いただいた内容を送信します。\nよろしいですか？')
                                      ? {
                                          await model.onPushSendChatDetail(chatTitle),
                                          await showTextDialog(context, '送信しました。'),
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
