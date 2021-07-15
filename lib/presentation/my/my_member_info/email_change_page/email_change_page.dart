import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'email_change_model.dart';

class EmailChangePage extends StatelessWidget {
  EmailChangePage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final String email = 'example@gmail.com';

  @override
  Widget build(BuildContext context) {
    emailController.text = email;
    return ChangeNotifierProvider(
      create: (_) => EmailChangeModel(),
      child: Consumer<EmailChangeModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('メールアドレスの変更'),
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('新しいメールアドレス'),
                  alignment: Alignment.topLeft,
                ),
                TextField(
                  controller: emailController,
                  autofocus: true,
                  onChanged: (text) {
                    model.userAddress = text;
                  },
                  decoration: const InputDecoration(labelText: 'メールアドレスの変更'),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.1)),
                  child: const Text(
                    'メールアドレスを変更する',
                    style: TextStyle(color: Colors.black),
                  ),
                  //TODO Firebaseの値更新処理を追加予定
                  onPressed: () async {
                    await showTextDialog(context, 'メールアドレスを変更しました');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
