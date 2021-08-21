import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/login/login_model.dart';
import 'package:eastarrow_app/presentation/register/register_page.dart';
import 'package:eastarrow_app/presentation/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormBuilderState>();

    return ChangeNotifierProvider(
      create: (_) => LoginModel(),
      child: Consumer<LoginModel>(
        builder: (context, model, child) {
          return Scaffold(
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
                    SizedBox(height: size.height / 10),
                    // TextField(
                    //   autofocus: false,
                    //   decoration: const InputDecoration(hintText: 'example@gmail.com'),
                    //   controller: model.mailController,
                    // ),
                    // const SizedBox(height: 8),
                    // TextField(
                    //   decoration: const InputDecoration(hintText: 'password'),
                    //   controller: model.passwordController,
                    //   obscureText: true,
                    // ),
                    FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'mail',
                            decoration: const InputDecoration(
                              hintText: 'example@email.com',
                            ),
                            controller: model.mailController,
                            // onChanged: _onChanged,
                            // valueTransformer: (text) => num.tryParse(text),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,errorText: 'メールアドレスを入力してください'),
                              FormBuilderValidators.email(context),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 8),
                          FormBuilderTextField(
                            name: 'password',
                            decoration: const InputDecoration(
                              hintText: 'password',
                            ),
                            controller: model.passwordController,
                            // onChanged: _onChanged,
                            // valueTransformer: (text) => num.tryParse(text),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.minLength(context, 6),
                            ]),
                            keyboardType: TextInputType.number,
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
                          'ログイン',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                          ),
                        ),
                        onPressed: () async => model.onPushLogin(context),
                      ),
                    ),
                    const SizedBox(height: 16),
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
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: TextButton(
                        child: const Text(
                          'パスワードを忘れた場合',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () => null,
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
