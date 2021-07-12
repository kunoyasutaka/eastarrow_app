import 'package:eastarrow_app/presentation/my/my_member_info/email_change_page/email_change_page.dart';
import 'package:eastarrow_app/presentation/my/my_member_info/password_change_page/password_change_page.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 48,
            color: Theme.of(context).colorScheme.primary,
            child: const Center(
              child: Text(
                '会員情報',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            child: Container(
              width: size.width * 9 / 10,
              //color: AppColors.navyBlue,
              child: const ListTile(
                leading: Text(
                  'メールアドレス変更',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmailChangePage()),
              );
            },
          ),
          const SizedBox(height: 16),
          InkWell(
            child: Container(
              width: size.width * 9 / 10,
              //color: AppColors.navyBlue,
              child: const ListTile(
                leading: Text(
                  'パスワード変更',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PasswordChangePage()),
              );
            },
          ),
          const SizedBox(height: 16),
          InkWell(
            child: Container(
              width: size.width * 9 / 10,
              //color: AppColors.navyBlue,
              child: const ListTile(
                leading: Text(
                  '利用規約',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                ),
              ),
            ),
            //TODO 画面遷移追加予定
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
