import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/login/reset_password/reset_password_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => ResetPasswordModel(),
      child: Consumer<ResetPasswordModel>(
        builder: (context, model, child) {
          return Scaffold(
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
                      const SizedBox(height: 20),
                      Align(
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: size.height / 10),
                      FormBuilder(
                        key: model.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: FormBuilderTextField(
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
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: ElevatedButton(
                          child: const Text(
                            'パスワード再設定メールを送信する',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32)),
                            ),
                          ),
                          onPressed:() async {
                            final result = await model.resetPassword();
                            if (result == 'success') {
                              await showTextDialog(context, 'パスワード再設定メールを送信しました。');
                              Navigator.pop(context);
                            } else {
                              model.inputError(result);
                              return;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (model.errorMessage == 'ユーザーが見つかりません')
                        Padding(
                          child: Align(
                            child: Text(
                              model.errorMessage,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          padding: const EdgeInsets.only(left: 12),
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
