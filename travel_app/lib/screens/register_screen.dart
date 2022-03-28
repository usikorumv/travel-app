import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/activate_screen.dart';

import '../components/custom_button.dart';
import '../components/custom_form.dart';
import '../states/user_state.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static String routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '', _password = '', _password_confirm = '';

  _register() async {
    bool isRegistered = await Provider.of<UserState>(
      context,
      listen: false,
    ).register(_email, _password, _password_confirm);
    if (isRegistered) {
      Navigator.of(context).pushReplacementNamed(ActivateScreen.routeName);
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
                SizedBox(height: 180),
                CustomInputField(
                  textInputType: TextInputType.emailAddress,
                  hintText: "New email",
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
                  hintText: "New password",
                  isPasswordField: true,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                  onChanged: (text) {
                    _password = text;
                  },
                ),
                SizedBox(height: 20),
                CustomInputField(
                  textInputType: TextInputType.visiblePassword,
                  hintText: "Confirm password",
                  isPasswordField: true,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                  onChanged: (text) {
                    _password_confirm = text;
                  },
                ),
                SizedBox(height: 50),
                CustomTextButton(
                  text: "Register",
                  onTap: () {
                    _register();
                  },
                ),
                SizedBox(height: 20),
                Divider(
                  thickness: 2,
                  indent: 1,
                  endIndent: 10,
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Already have account?  ",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      TextSpan(
                        text: "Login now",
                        style: TextStyle(
                          color: Color(0xFF335BA4),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.routeName);
                          },
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

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Register Now"),
//     ),
//     body: Padding(
//       padding: EdgeInsets.all(12),
//       child: SingleChildScrollView(
//         child: Form(
//           key: _form,
//           child: Column(
//             children: [
//               TextFormField(
//                 validator: (v) {
//                   if (v.isEmpty) {
//                     return 'Enter Your Username';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Username",
//                 ),
//                 onSaved: (v) {
//                   _username = v;
//                 },
//               ),
//               TextFormField(
//                 validator: (v) {
//                   if (v.isEmpty) {
//                     return 'Enter Your password';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                 ),
//                 onChanged: (v) {
//                   setState(() {
//                     _confpassword = v;
//                   });
//                 },
//                 onSaved: (v) {
//                   _password = v;
//                 },
//                 obscureText: true,
//                 autocorrect: false,
//                 enableSuggestions: false,
//               ),
//               TextFormField(
//                 validator: (v) {
//                   if (_confpassword != v) {
//                     return 'Confirm password';
//                   }
//                   if (v.isEmpty) {
//                     return 'Confirm Your password';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Confirm Password",
//                 ),
//                 onSaved: (v) {
//                   _password = v;
//                 },
//                 obscureText: true,
//                 autocorrect: false,
//                 enableSuggestions: false,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   RaisedButton(
//                     onPressed: () {
//                       _registerNow();
//                     },
//                     child: Text("Register"),
//                   ),
//                   FlatButton(
//                     onPressed: () {
//                       Navigator.of(context)
//                           .pushReplacementNamed(LoginScrrens.routeName);
//                     },
//                     child: Text(
//                       "Login New",
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
