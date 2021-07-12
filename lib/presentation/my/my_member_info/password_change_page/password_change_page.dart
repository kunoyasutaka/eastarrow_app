import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/my/my_member_info/password_change_page/password_change_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordChangePage extends StatelessWidget {
  PasswordChangePage({Key? key}) : super(key: key);

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PasswordChangeModel(),
      child: Consumer<PasswordChangeModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('パスワードの変更'),
            ),
            body: Column(
              children: [
                TextField(
                  controller: currentPasswordController,
                  autofocus: true,
                  obscureText: true,
                  onChanged: (text) {
                    model.currentPassword = text;
                  },
                  decoration: const InputDecoration(labelText: '現在のパスワード'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: newPasswordController,
                  autofocus: true,
                  obscureText: true,
                  onChanged: (text) {
                    model.newPassword = text;
                  },
                  decoration: const InputDecoration(
                    labelText: '新しいパスワード',
                    hintText: '6文字以上',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: newPasswordConfirmController,
                  autofocus: true,
                  obscureText: true,
                  onChanged: (text) {
                    model.newPasswordConfirm = text;
                  },
                  decoration: const InputDecoration(
                    labelText: '新しいパスワード(確認)',
                    hintText: '6文字以上',
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.1)),
                  child: const Text(
                    'パスワードを変更する',
                    style: TextStyle(color: Colors.black),
                  ),
                  //TODO Firebaseの値更新処理を追加予定
                  onPressed: () async {
                    try {
                      await showTextDialog(context, 'パスワードを変更しました');
                    } catch (error) {
                      await showTextDialog(context, error.toString());
                    }
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
