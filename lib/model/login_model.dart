//import 'dart:convert';
//import 'package:get/get.dart';
//import 'package:http/http.dart' as http;

class User {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({this.id, this.email, this.lastName, this.firstName, this.avatar});
  //                                      String , Belakangnya tipe datanya dinamis
  factory User.createUser(Map<String, dynamic> object) {
    var user = User(
      id: object['id'].toString(),
      email: object['email'],
      firstName: object['first_name'],
      lastName: object['last_name'],
      avatar: object['avatar'],
    );

    return user;
  }
}
