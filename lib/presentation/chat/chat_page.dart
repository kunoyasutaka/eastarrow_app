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
        builder: (context, model, snapshot) {
          return GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('連絡'),
                centerTitle: true,
              ),
              endDrawer: const Drawer(),
              body: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: model.chatLog.length,
                        itemBuilder: (BuildContext context, int index) {
                          return chatLogTile(model.chatLog[index], model);
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
                                onPressed: () =>
                                    showConfirmDialog(context, '送信しますか？'),
                                icon: const Icon(Icons.send)),
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

  chatLogTile(ChatLog chatLog, ChatModel model) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey, width: 1),
      )),
      child: ExpansionTile(
        leading: chatLog.sender == '管理者'
            ? const Icon(Icons.mail)
            : const Icon(Icons.person),
        trailing: const Icon(Icons.reply),

        // trailing: model.replyButton(chatLog),
        title: Text('件名：${chatLog.title}'),
        subtitle: Text(chatLog.date),
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(chatLog.description),
          )
        ],
      ),
    );
  }
}
