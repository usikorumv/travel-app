import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/components/custom_button.dart';

import '../components/custom_form.dart';
import '../states/user_state.dart';
import 'home/home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  static String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '', _password = '';

  void _login() async {
    // var valid = _form.currentState.validate();
    // if (!valid) {
    //   return;
    // }
    // _form.currentState!.save();
    bool isToken = await Provider.of<UserState>(
      context,
      listen: false,
    ).login(_email, _password);
    if (isToken) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Something is wrong.Try Again"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 158),
                  Text(
                    "SAKURA",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(child: Image.asset("assets/images/sakura.png")),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 27),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 120),
                CustomInputField(
                  textInputType: TextInputType.emailAddress,
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.alternate_email_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                  onChanged: (text) {
                    _email = text;
                  },
                ),
                SizedBox(height: 30),
                CustomInputField(
                  textInputType: TextInputType.visiblePassword,
                  hintText: "Password",
                  isPasswordField: true,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                  suffixIcon: SizedBox(),
                  onChanged: (text) {
                    _password = text;
                  },
                ),
                SizedBox(height: 50),
                CustomTextButton(
                  text: "Login",
                  onTap: () {
                    _login();
                  },
                ),
                SizedBox(height: 20),
                Divider(thickness: 2, indent: 1, endIndent: 10,),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Don`t have account?  ", style: TextStyle(
                        color: Colors.black,
                      )),
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: Color(0xFF335BA4),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushReplacementNamed(RegisterScreen.routeName);                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
