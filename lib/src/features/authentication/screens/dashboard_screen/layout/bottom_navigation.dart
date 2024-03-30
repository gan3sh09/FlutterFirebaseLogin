import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class DashboardBottomNavigation extends StatelessWidget {
  const DashboardBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 14),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? exContainerLight
          : scafDarkBackground,
      unselectedItemColor: Theme.of(context).brightness == Brightness.light
          ? secondaryColor
          : whiteColor,
      elevation: 0,
      selectedItemColor: Theme.of(context).brightness == Brightness.light
          ? secondaryColor
          : whiteColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
