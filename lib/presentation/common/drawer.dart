import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/common/drawer_model.dart';
import 'package:eastarrow_app/presentation/common/drawer_tile.dart';
import 'package:eastarrow_app/presentation/register/register_page.dart';
import 'package:eastarrow_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget drawer() {
  return ChangeNotifierProvider(
    create: (_) => DrawerModel(),
    child: Consumer<DrawerModel>(
      builder: (context, model, child) {
        return Drawer(
          child: Container(
            color: AppColors.lightGrey,
            child: ListView(
              children: [
                Container(
                  child: const Text(
                    'MENU',
                    style: TextStyle(color: AppColors.navyBlue, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.only(left: 24, top: 16, bottom: 16),
                  margin: EdgeInsets.zero,
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
                ),
                InkWell(
                    child: drawerTile(Icons.logout, 'ログアウト'),
                    onTap: () async {
                      await model.logout();
                      await showTextDialog(context, 'ログアウトしました。');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    }),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.person, size: 28),
                  title: Text('会員情報を編集', style: TextStyle(fontSize: 16)),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.corporate_fare, size: 28),
                  title: Text('HPはこちら', style: TextStyle(fontSize: 16)),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.account_circle, size: 28),
                  title: Text('プライバシーポリシー', style: TextStyle(fontSize: 16)),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.assignment_outlined, size: 28),
                  title: Text('利用規約', style: TextStyle(fontSize: 16)),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.logout, size: 28),
                  title: Text('ログアウト', style: TextStyle(fontSize: 16)),
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    ),
  );
}
