import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'connector/homeconnector.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class Home extends StatefulWidget {
  static const String id = 'id';
  @override
  _UsersListState createState() {
    _UsersListState obb = _UsersListState();
    return obb;
  }
}

class _UsersListState extends State<Home> {
  var dataa;
  HomeConnector _con = Get.put(HomeConnector());

  void getuser() {
    setState(() {
      // dataa = _con.response.body;
      //  dataa = jsonDecode(_con.data);
      dataa = _con.data;
    });
  }

//here
  String getname(int index) {
    if (dataa != null) {
      return dataa['data'][index]['first_name'] +
          dataa['data'][index]['last_name'];
    } else {
      return Error.safeToString("error");
    }
    //return dataa['data'][index]['first_name'] +
    //dataa['data'][index]['last_name'];
  }

  String getemail(int index) {
    if (dataa != null) {
      return dataa['data'][index]['email'];
    } else {
      return Error.safeToString("error");
    }
  }

  String getimage(int index) {
    if (dataa != null) {
      return dataa['data'][index]['avatar'];
    } else {
      return Error.safeToString("error");
    }
  }
  // String? fname, lname, email, name;

  @override
  void initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getuser();
//getuser();

    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(builder: (context, projectSnap) {
          if (dataa == null) {
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
                        child: Image.network(getimage(index))),
                    //Image.network(_con.data[index].getimage)),
                    title: Text(
                      // _homeController.userListData[index].firstName,
                      getname(index),
                      //_con.data[index].getname,
                    ),
                    subtitle: Text(
                      getemail(index),
                      // getemail(index),
                      //_con.data[index].getemail,
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
