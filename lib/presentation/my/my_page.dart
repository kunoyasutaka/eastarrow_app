import 'package:eastarrow_app/presentation/my/my_member_info/email_change_page/email_change_page.dart';
import 'package:eastarrow_app/presentation/my/my_member_info/password_change_page/password_change_page.dart';
import 'package:eastarrow_app/presentation/my/my_page_model.dart';
import 'package:eastarrow_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyPageModel(),
      child: Consumer<MyPageModel>(builder: (context, model, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('マイページ'),
          ),
          endDrawer: const Drawer(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '名前',
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  autofocus: false,
                  controller: model.nameController,
                  textAlign: TextAlign.end,
                  onChanged: (text) {},
                ),
                const SizedBox(height: 15),
                const Text(
                  'メールアドレス',
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  autofocus: false,
                  controller: model.mailController,
                  textAlign: TextAlign.end,
                  onChanged: (text) {},
                ),
                const SizedBox(height: 15),
                const Text(
                  '生年月日',
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  autofocus: false,
                  controller: model.birthdayController,
                  textAlign: TextAlign.end,
                  onChanged: (text) {},
                  onTap: () => model.selectedDate(context),
                ),
                const SizedBox(height: 15),
                const Text(
                  '住所',
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  autofocus: false,
                  controller: model.addressController,//TODO 住所編集の方法
                  textAlign: TextAlign.end,
                  onChanged: (text) {},
                ),
                const SizedBox(height: 15),
                const Text(
                  '電話番号',
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  autofocus: false,
                  controller: model.telephoneNumberController,//TODO 電話番号編集の方法
                  textAlign: TextAlign.end,
                  onChanged: (text) {},
                ),
                Expanded(child: Container()),
                const SizedBox(
                  height: 50,
                  width: 500, //TODO ボタン横幅を最大にする書き方
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('ユーザー情報を更新'),
                    style: ButtonStyle(),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
