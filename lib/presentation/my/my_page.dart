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
          endDrawer: Drawer(),
          body: Column(
            children: [
              const SizedBox(height: 8),
              TextField(
                autofocus: false,
                controller: model.nameController,
                onChanged: (text) {
                  print(model.nameController);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
