import 'package:eastarrow_app/presentation/question_page/question_page.dart';
import 'package:eastarrow_app/presentation/register/register_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterModel(),
      child: Consumer<RegisterModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('新規登録'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'アプリダウンロードありがとうございます。\nまずは、初回登録をお願いいたします。',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      autofocus: false,
                      decoration:
                          const InputDecoration(hintText: 'example@gmail.com'),
                      controller: model.mailController,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(hintText: 'password'),
                      controller: model.passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration:
                          const InputDecoration(hintText: 'password(確認用)'),
                      controller: model.passwordConfirmController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        child: const Text(
                          '新規会員登録',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (!model.checkPassword()) {
                            return;
                          }
                          if (await model.createUser() == null) {
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  QuestionPage(mail: model.mailController.text),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
