import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/my/my_page_model.dart';
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
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('マイページ'),
              ),
              endDrawer: const Drawer(),
              body: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: SingleChildScrollView(
                child: Container(
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
                        onChanged: (text) => model.nameController.text = text,
                      ),
                      const SizedBox(height: 16),
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
                      const SizedBox(height: 16),
                      const Text(
                        '生年月日',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        autofocus: false,
                        controller: model.birthdayController,
                        textAlign: TextAlign.end,
                        onChanged: (text) {},
                        onTap: () async => await model.selectBirthday(context),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '住所',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        autofocus: false,
                        controller: model.addressController,
                        keyboardType: TextInputType.streetAddress,
                        textAlign: TextAlign.end,
                        onChanged: (text) {},
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '電話番号',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        autofocus: false,
                        controller: model.phoneNumberController,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.end,
                        onChanged: (text) {},
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '車種',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        autofocus: false,
                        controller: model.vehicleTypeController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.end,
                        onChanged: (text) {},
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '車検日',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        autofocus: false,
                        controller: model.inspectionController,
                        textAlign: TextAlign.end,
                        onChanged: (text) {},
                        onTap: () async =>
                            await model.selectInspectionDay(context),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () =>
                                showConfirmDialog(context, 'ユーザー情報を更新しますか？'),
                            child: const Text('ユーザー情報を更新'),
                          ), //TODO 情報変更時ボタンをアクティブに＆DBをupdate
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
