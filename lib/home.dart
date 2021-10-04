import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'connector/homeconnector.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class Home extends StatefulWidget {
  static const String id = 'users_screen';
  @override
  _UsersListState createState() {
    _UsersListState obb = _UsersListState();
    return obb;
  }
}

class _UsersListState extends State<Home> {
  //class HomeConnector extends GetConnect {
  HomeConnector _con = Get.put(HomeConnector());

  String? getname(int index) {
    if (_con.data != null) {
      return _con.data['data'][index]['first_name'] +
          _con.data['data'][index]['last_name'];
    }
    //  return getname;
  }

  String? getemail(int index) {
    if (_con.data != null) {
      return _con.data['data'][index]['email'];
    }
    // return getemail;
  }

  String? getimage(int index) {
    if (_con.data != null) {
      return _con.data['data'][index]['avatar'];
    }
  }

  @override
  void initState() {
    _con.getUsersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _con.getUsersList();

    //setState(() {
    //_con.data = _con.response.body;
    // _con.data = jsonDecode(_con.data);
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(builder: (context, projectSnap) {
          if (_con.data == null) {
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          return Container(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: // Image.network( getimage(index)))
                            Image.network(_con.data[index].getimage)),
                    title: Text(
                      // _homeController.userListData[index].firstName,
                      _con.data[index].getname,
                    ),
                    subtitle: Text(
                      // getemail(index),
                      _con.data[index].getemail,
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
