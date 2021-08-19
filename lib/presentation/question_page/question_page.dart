import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/question_page/question_model.dart';
import 'package:eastarrow_app/presentation/root.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatelessWidget {
  final String mail;

  const QuestionPage({Key? key, required this.mail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestionModel(),
      child: Consumer<QuestionModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('アンケート'),
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
                      const Center(
                        child: Text(
                          'ユーザー情報の回答をお願いします。',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        '名前',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        autofocus: false,
                        controller: model.nameController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '生年月日',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        autofocus: false,
                        controller: model.birthdateController,
                        textAlign: TextAlign.start,
                        onTap: () async => await model.selectBirthday(context),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '住所',
                        style: TextStyle(fontSize: 20),
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
                        style: TextStyle(fontSize: 20),
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
                        style: TextStyle(fontSize: 20),
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
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        autofocus: false,
                        controller: model.inspectionController,
                        textAlign: TextAlign.start,
                        onTap: () async => await model.selectInspectionDay(context),
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
                            onPressed: () async {
                              if (await showConfirmDialog(context, 'この内容で登録しますか？')) {
                                model.onPushAddMember(mail);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Root(),
                                  ),
                                );
                              }
                            },
                            child: const Text('ユーザー情報を登録'),
                          ),
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
