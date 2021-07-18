import 'package:eastarrow_app/presentation/my/my_page_model.dart';
import 'package:eastarrow_app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyPageModel(),
      child: Consumer<MyPageModel>(
        builder: (context, model, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('マイページ'),
            ),
            endDrawer: const Drawer(),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height - 236,
                      padding: const EdgeInsets.all(20),
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
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.end,
                            onChanged: (text) =>
                                model.nameController.text = text,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'メールアドレス',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextField(
                            autofocus: false,
                            controller: model.mailController,
                            keyboardType: TextInputType.emailAddress,
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
                            controller: model.addressController,
                            //TODO 住所編集の方法
                            keyboardType: TextInputType.streetAddress,
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
                            controller: model.phoneNumberController,
                            //TODO 電話番号編集の方法
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.end,
                            onChanged: (text) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200),
                  child: const SizedBox(
                    height: 50,
                    width: 500, //TODO ボタン横幅を最大にする書き方
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('ユーザー情報を更新'),
                      style: ButtonStyle(),
                    ), //TODO 情報変更時ボタンをアクティブに＆DBをupdate
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
