import 'package:eastarrow_app/domain/chatdetail.dart';
import 'package:eastarrow_app/domain/user.dart';
import 'package:eastarrow_app/presentation/chat/chat_detail/chat_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatDetailPage extends StatelessWidget {
  final Map chatTitle;
  final List<ChatDetail> chatDetailList;

  const ChatDetailPage({
    Key? key,
    required this.chatTitle,
    required this.chatDetailList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatTitle[ChatTitleField.title]),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => ChatDetailModel(),
        child: Consumer<ChatDetailModel>(
          builder: (context, model, child) {
            return ListView.builder(
              itemCount: chatDetailList.length,
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
                          chatDetailList[index].sender == '管理者'
                              ? const Icon(Icons.mail, size: 20)
                              : const Icon(Icons.person, size: 20),
                          const SizedBox(width: 12),
                          Text(chatDetailList[index].sender!),
                          const Expanded(child: SizedBox()),
                          Text((DateFormat('yyyy/MM/dd  HH:mm')).format(chatDetailList[index].createdAt!))
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Text(chatDetailList[index].body!),
                      ),
                      // chatDetailList[index].imageUrl != []
                      //     ? ListView.builder(
                      //         itemCount: chatDetailList[index].imageUrl!.length,
                      //         itemBuilder: (context, imageIndex) {
                      //           return Container(
                      //             padding: const EdgeInsets.all(12),
                      //             child: Image.network(
                      //               chatDetailList[index].imageUrl![imageIndex],
                      //               width: double.infinity,
                      //             ),
                      //           );
                      //         })
                      //     : Container(),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
