import 'package:eastarrow_app/presentation/admission/emergency_page.dart';
import 'package:eastarrow_app/presentation/chat/chat_page.dart';
import 'package:eastarrow_app/presentation/goods/goods_page.dart';
import 'package:eastarrow_app/presentation/my/my_page.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  static const _footerIcons = [
    Icons.directions_car_rounded,
    Icons.info_sharp,
    Icons.quick_contacts_dialer,
    Icons.account_box_rounded,
  ];

  static const _footerItemNames = [
    '入荷情報',
    '連絡',
    '緊急連絡',
    'マイページ',
  ];

  var routes = [
    const GoodsPage(),
    const ChatPage(),
    const EmergencyPage(),
    const MyPage(),
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(_updateDeactiveState(i));
    }
  }

  BottomNavigationBarItem _updateActiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.grey,
      ),
      label: _footerItemNames[index],
    );
  }

  BottomNavigationBarItem _updateDeactiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.black45,
      ),
      label: _footerItemNames[index],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavigationBarItems[_selectedIndex] =
          _updateDeactiveState(_selectedIndex);
      _bottomNavigationBarItems[index] = _updateActiveState(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: routes.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedItemColor: Colors.grey,
      ),
    );
  }
}
