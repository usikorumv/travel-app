import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_form.dart';
import 'package:travel_app/screens/login_screen.dart';
import 'package:travel_app/screens/register_screen.dart';

import '../states/user_state.dart';

class ActivateScreen extends StatefulWidget {
  const ActivateScreen({Key? key}) : super(key: key);

  static String routeName = "/activate";

  @override
  State<ActivateScreen> createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> {
  String _code = "";

  void _activate() async {
    bool isActivated = await Provider.of<UserState>(
      context,
      listen: false,
    ).activate(_code);
    if (isActivated) {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomInputField(
              hintText: "Activation Code",
              onChanged: (text) {
                _code = text;
              },
            ),
            SizedBox(height: 20),
            CustomTextButton(
              text: "Activate",
              onTap: () {
                _activate();
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
                    text: "Come back to Register Page",
                    style: TextStyle(
                      color: Color(0xFF335BA4),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterScreen.routeName);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
