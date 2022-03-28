import 'package:flutter/material.dart';
import 'package:travel_app/components/bottom_nav_bar_icon.dart';
import 'package:travel_app/components/transparent_appbar.dart';
import 'package:travel_app/screens/home/pages/favorites_page.dart';
import 'package:travel_app/screens/home/pages/home_page.dart';
import 'package:travel_app/screens/home/pages/profile_page.dart';
import 'package:travel_app/screens/home/pages/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _body = [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: _currentIndex != 3
            ? TransparentAppBar(
                centerTitle: false,
                title: Text(
                  "Hi, Sam",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/no_profile_picture.png",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 22),
                ],
              )
            : TransparentAppBar(),
      ),
      body: _body[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: const Color(0xFF235CA9),
            unselectedItemColor: Colors.black,
            items: [
              BottomNavBarIcon(Icons.home_rounded),
              BottomNavBarIcon(Icons.search),
              BottomNavBarIcon(Icons.favorite),
              BottomNavBarIcon(Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
