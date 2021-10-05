import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_user/model/login_model.dart';

class HomeConnector extends GetConnect {
  var data;
  Future<Response?> getUsersList() async {
    try {
      final response = await get('https://reqres.in/api/users?page=2');
      // setState(() {
      data = response.body["Datum"];
      data = jsonDecode(data);
      // });
    } catch (e) {
      print(e);
    }
  }
}
