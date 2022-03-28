import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/activate_screen.dart';

import 'package:travel_app/screens/home/home_screen.dart';
import 'package:travel_app/screens/login_screen.dart';
import 'package:travel_app/screens/register_screen.dart';
import 'package:travel_app/states/travels_state.dart';
import 'package:travel_app/states/user_state.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = new LocalStorage('usertoken');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserState()),
        ChangeNotifierProvider(create: (ctx) => TravelsState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        )),
        home: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (storage.getItem('token') == null) {
              return LoginScreen();
            }
            return HomeScreen();
          },
        ),
        routes: {
          RegisterScreen.routeName: (context) => RegisterScreen(),
          ActivateScreen.routeName: (context) => ActivateScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
      ),
    );
  }
}
