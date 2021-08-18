import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/common/drawer.dart';
import 'package:eastarrow_app/presentation/common/select_inspection_day.dart';
import 'package:eastarrow_app/presentation/my/my_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyPageModel()..init(),
      child: Consumer<MyPageModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('マイページ'),
            ),
            endDrawer: drawer(),
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
                      Container(
                        width: double.infinity,
                        child: const Text(
                          '会員情報',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '名前',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              autofocus: false,
                              controller: model.nameController,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'メールアドレス',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              autofocus: false,
                              controller: model.mailController,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '生年月日',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              autofocus: false,
                              controller: model.birthdayController,
                              textAlign: TextAlign.start,
                              onTap: () async => await model.selectBirthday(context),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '住所',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              autofocus: false,
                              controller: model.locationController,
                              keyboardType: TextInputType.streetAddress,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '電話番号',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              autofocus: false,
                              controller: model.phoneNumberController,
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '車種',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              autofocus: false,
                              controller: model.carTypeController,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '車検日',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              autofocus: false,
                              controller: model.inspectionController,
                              textAlign: TextAlign.start,
                              onTap: () async => await selectInspectionDay(context,model.inspectionController),
                            ),
                            const Text(
                              '※車検日の1ヶ月前にお知らせいたします。',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal:20.0),
                              child: SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async => await showConfirmDialog(context, 'ユーザー情報を更新しますか？'),
                                  child: const Text('会員情報を更新' ,style: TextStyle(fontWeight: FontWeight.bold),),
                                ), //TODO 情報変更時ボタンをアクティブに＆DBをupdate
                              ),
                            ),
                          ],
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
