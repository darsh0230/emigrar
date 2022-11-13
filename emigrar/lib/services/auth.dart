import 'dart:convert';
import 'package:emigrar/constants/constantEnv.dart';
import 'package:emigrar/models/auth.dart';
import 'package:emigrar/providers/authProvider.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> login(String email, String password, BuildContext context) async {
  Env env = Env();

  try {
    var response = await http.post(
        Uri.parse(
          "${env.baseUrl}auth/login",
        ),
        body: {"email": email, "password": password});

    if (response.statusCode == 200) {
      var userData = jsonDecode(response.body.toString())["user"];
      context.read<AuthProvider>().setUser(CusUser.fromJson(userData));
      context.read<AuthProvider>().storeAuthCred();
      Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
      );

      return true;
    }
  } catch (e) {
    print(e);
  }
  Fluttertoast.showToast(
    msg: "something went wrong. Try again later",
    toastLength: Toast.LENGTH_SHORT,
  );
  return false;
}

Future<bool> register(
    String email, String password, String name, BuildContext context) async {
  Env env = Env();

  try {
    var response = await http.post(
        Uri.parse(
          "${env.baseUrl}auth/register",
        ),
        body: {"email": email, "password": password, "name": name});

    if (response.statusCode == 201) {
      var userData = jsonDecode(response.body.toString())["user"];
      context.read<AuthProvider>().setUser(CusUser.fromJson(userData));
      context.read<AuthProvider>().storeAuthCred();
      Fluttertoast.showToast(
        msg: "Registration Successful",
        toastLength: Toast.LENGTH_SHORT,
      );
      return true;
    }
    if (response.statusCode == 400) {
      Fluttertoast.showToast(
        msg: "Email Already Exists",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  } catch (e) {
    print(e);
  }
  Fluttertoast.showToast(
    msg: "something went wrong. Try again later",
    toastLength: Toast.LENGTH_SHORT,
  );
  return false;
}
