import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class UserState with ChangeNotifier {
  LocalStorage storage = new LocalStorage('user');

  Future<bool> login(String email, String password) async {
    String url = 'http://127.0.0.1:8000/account/login/';
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
            "password": password,
          }));
      var data = json.decode(response.body) as Map;

      if (data.containsKey("token")) {
        storage.setItem("token", data['token']);
        print(storage.getItem('token'));
        return true;
      }
      return false;
    } catch (e) {
      print("Login occurs exception: $e");
      return false;
    }
  }

  Future<bool> register(
      String email, String password, String passwordConfirm) async {
    String url = 'http://127.0.0.1:8000/account/register/';
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": email,
            "password": password,
            "password_confirm": passwordConfirm,
          }));
      storage.setItem("email", email);
      var data = json.decode(response.body) as Map;
      // print(data);
      // if (data["error"] == false) {
      //   return true;
      // }
      // return false;
      print(data);
      return true;
    } catch (e) {
      print("Register occurs exception: $e");
      return false;
    }
  }

  Future<bool> activate(String code) async {
    String url = 'http://127.0.0.1:8000/account/activate/';
    try {
      print(storage.getItem("email"));
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email": storage.getItem("email"),
            "code": code,
          }));
      // print(data);
      // if (data["error"] == false) {
      //   return true;
      // }
      // return false;
      return true;
    } catch (e) {
      print("Activate occurs exception: $e");
      return false;
    }
  }
}
