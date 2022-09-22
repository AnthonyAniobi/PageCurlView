import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/screens/carts/cart_screen.dart';
import 'package:ntisa_burgers/screens/favorites/favorites_screen.dart';
import 'package:ntisa_burgers/screens/history/history_screen.dart';
import 'package:ntisa_burgers/screens/homepage/homepage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TabOverlay extends StatelessWidget {
  TabOverlay({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const Homepage(),
      const CartScreen(),
      const FavoriteScreen(),
      const HistoryScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.house),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        activeColorPrimary: AppColors.orange,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.basketShopping),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        activeColorPrimary: AppColors.orange,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.heart),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        activeColorPrimary: AppColors.orange,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        activeColorPrimary: AppColors.orange,
        inactiveColorPrimary: AppColors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      // backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      // decoration: NavBarDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   colorBehindNavBar: Colors.white,
      // ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
