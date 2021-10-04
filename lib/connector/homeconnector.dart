import 'package:get/get.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeConnector extends GetConnect {
  var data;
  //String fname, lname, email, name;
  Future<void> getUsersList() async {
    try {
      Response response = await get('https://reqres.in/api/users?page=2');
      // setState(() {
      data = response.body;
      //data = jsonDecode(data);
      //});

      //data = response.body;

      // data = jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  // String? fname, lname, email, name;
}
