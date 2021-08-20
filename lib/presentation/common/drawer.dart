import 'package:eastarrow_app/presentation/common/dialog.dart';
import 'package:eastarrow_app/presentation/common/drawer_tile.dart';
import 'package:eastarrow_app/presentation/login/login_page.dart';
import 'package:eastarrow_app/presentation/my/my_page.dart';
import 'package:eastarrow_app/repository/auth_repository.dart';
import 'package:eastarrow_app/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.lightGrey,
        child: ListView(
          children: [
            Container(
              child: const Text(
                'MENU',
                style: TextStyle(
                    color: AppColors.navyBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              padding: const EdgeInsets.only(left: 24, top: 16, bottom: 16),
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey))),
            ),
            InkWell(
              child: drawerTile(Icons.person, '会員情報を編集'),
              onTap: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyPage(),
                  ),
                );
              },
            ),
            const Divider(),
            InkWell(
                child: drawerTile(Icons.corporate_fare, 'HPはこちら'),
                onTap: () async {
                  await showTextDialog(context, 'HPリンク');
                }),
            const Divider(),
            InkWell(
                child: drawerTile(Icons.account_circle, 'プライバシーポリシー'),
                onTap: () async {
                  await showTextDialog(context, 'プライバシーポリシー');
                }),
            const Divider(),
            InkWell(
                child: drawerTile(Icons.assignment_outlined, '利用規約'),
                onTap: () async {
                  await showTextDialog(
                      context, FirebaseAuth.instance.currentUser!.uid);
                }),
            const Divider(),
            InkWell(
                child: drawerTile(Icons.logout, 'ログアウト'),
                onTap: () async {
                  AuthRepository().signOut();
                  await showTextDialog(context, 'ログアウトしました。');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                }),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
