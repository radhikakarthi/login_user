import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:login_user/model/login_model.dart';

class LoginConnector extends GetConnect {
  TextEditingController? emailController;
  TextEditingController? passwdController;

  Future<int?> login(String username, String passwd) async {
    Response response;
    try {
      response = await post('https://reqres.in/api/login',
          // {"email": "eve.holt@reqres.in", "password": "cityslicka"});
          {"email": username, "password": passwd});

      print(response.statusCode);
      print(response.body);
      return response.statusCode;
    } catch (e) {
      print(e);
    }
  }
}
