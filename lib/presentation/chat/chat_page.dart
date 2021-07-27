import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatModel(),
      child: Consumer<ChatModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('連絡'),
              centerTitle: true,
            ),
            endDrawer: const Drawer(),
            body: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.chatLog.length,
                      itemBuilder: (BuildContext context, int logIndex) {
                        return Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1),
                            ),
                          ),
                          child: ExpansionTile(
                            trailing: IconButton(
                                onPressed: () => model.subjectController.text =
                                    model.chatLog[logIndex].title,
                                icon: const Icon(Icons.reply)),
                            title: Text('件名：${model.chatLog[logIndex].title}'),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: model.chatLog[logIndex].chatDetail.length,
                                itemBuilder: (BuildContext context, int detailIndex) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 1),
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                        left: 40,
                                        top: 12,
                                        right: 20,
                                        bottom: 12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [model.chatLog[logIndex].chatDetail[detailIndex].sender == '管理者'
                                                ? const Icon(Icons.mail, size: 20)
                                                : const Icon(Icons.person, size: 20),
                                            const SizedBox(width: 12),
                                            Text(model.chatLog[logIndex].chatDetail[detailIndex].sender),
                                            const Expanded(child: SizedBox()),
                                            Text(model.chatLog[logIndex].chatDetail[detailIndex].date),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(model.chatLog[logIndex].chatDetail[detailIndex].description),
                                        ),
                                        model.chatLog[logIndex].chatDetail[detailIndex].imageURL !=''
                                            ? Container(
                                                padding: const EdgeInsets.all(12),
                                                child: Image.network(
                                                  model.chatLog[logIndex].chatDetail[detailIndex].imageURL,
                                                  width: double.infinity,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
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
                                controller: model.subjectController,
                              ),
                            ),
                            IconButton(
                              onPressed: () async =>
                                  await showTextDialog(context, '画像を選択してください。'),
                              icon: const Icon(Icons.image),
                            ),
                            //TODO ImagePickerでファイルを取得
                            IconButton(
                              onPressed: () async =>
                                  await showTextDialog(context, '写真を撮影してください。'),
                              icon: const Icon(Icons.camera_alt),
                            ),
                            //TODO カメラを開く
                            IconButton(
                              onPressed: () async =>
                                  await showConfirmDialog(context, '送信しますか？'),
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
                          controller: model.mainTextController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
