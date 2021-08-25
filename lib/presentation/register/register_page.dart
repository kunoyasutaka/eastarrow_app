import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/question_page/question_page.dart';
import 'package:eastarrow_app/presentation/register/register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
            body: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                      const SizedBox(height: 32),
                      FormBuilder(
                        key: model.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: const {
                          'mail': '',
                          'password': '',
                          'passwordConfirm': '',
                        },
                        child: Column(
                          children: [
                            FormBuilderTextField(
                              name: 'mail',
                              controller: model.mailController,
                              decoration: const InputDecoration(
                                hintText: 'example@email.com',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.mail),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context, errorText: 'メールアドレスを入力してください'),
                                FormBuilderValidators.email(context, errorText: 'メールアドレスを正しい形式で入力してください'),
                              ]),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16),
                            FormBuilderTextField(
                              name: 'password',
                              controller: model.passwordController,
                              decoration: const InputDecoration(
                                hintText: 'password',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context, errorText: 'パスワードを入力してください'),
                                FormBuilderValidators.minLength(context, 6, errorText: 'パスワードは6文字以上で入力してください'),
                              ]),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(height: 16),
                            FormBuilderTextField(
                              name: 'passwordConfirm',
                              controller: model.passwordConfirmController,
                              decoration: const InputDecoration(
                                hintText: 'password(確認用)',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              validator: FormBuilderValidators.compose([
                                (value) {
                                  if (value != model.passwordController.text) {
                                    return 'パスワードが一致しません';
                                  }
                                  return null;
                                }
                              ]),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ],
                        ),
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
                            if (await model.createUser() == null) {
                              return;
                            }
                            await showTextDialog(context, '新規登録に成功しました。');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      QuestionPage(mail: model.mailController.text)),
                            );
                          },
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
