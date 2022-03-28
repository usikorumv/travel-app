import 'package:flutter/material.dart';

class BottomNavBarIcon extends BottomNavigationBarItem {
  BottomNavBarIcon(IconData icon, {Key? key})
      : super(
          icon: Icon(icon, size: 28,),
          label: "",
        );
}
