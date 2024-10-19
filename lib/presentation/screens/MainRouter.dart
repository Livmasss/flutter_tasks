import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task3/presentation/screens/cart/ShoppingCartScreen.dart';
import 'package:flutter_task3/presentation/screens/home/MainScreen.dart';
import 'package:flutter_task3/presentation/screens/profile/ProfileScreen.dart';

class MainRouter extends StatefulWidget {
  const MainRouter({super.key});

  @override
  State<MainRouter> createState() => _MainRouterState();
}

class _MainRouterState extends State<MainRouter> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    ShoppingCartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 0 ? 'lib/assets/icons/Home_active.svg' : 'lib/assets/icons/Home.svg'),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 1 ? 'lib/assets/icons/Cart_active.svg' : 'lib/assets/icons/Cart.svg'),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 2 ? 'lib/assets/icons/User_active.svg' : 'lib/assets/icons/User.svg'),
              label: 'Профиль',
            )
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex
      ),
    );
  }
}
