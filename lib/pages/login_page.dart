import "package:flutter/material.dart";
//import 'package:login/home.dart';
//import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:login_user/connector/login_controller.dart';
//import 'package:login_user/model/login_model.dart';

class MyLogin extends StatefulWidget {
  @override
  _LoginDemoState createState() {
    _LoginDemoState obj = _LoginDemoState();
    return obj;
  }
}

class _LoginDemoState extends State<MyLogin> {
  LoginConnector conn = Get.put(LoginConnector());
  final emailController = TextEditingController();
  final passwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.all(30),
                child: ListTile(
                  leading: Icon(
                    Icons.face,
                    color: Colors.black,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 20, bottom: 15),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: emailController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 15, bottom: 20),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: passwdController,
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                ),
                onPressed: () async {
                  final String email = emailController.text;
                  final String passwd = passwdController.text;
                  int? responsecode = await conn.login(email, passwd);
                  if (responsecode == 200) {
                    Get.toNamed("/home", arguments: "home page");
                  } else {
                    Get.snackbar("failed", "invalid username or passwd");
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
