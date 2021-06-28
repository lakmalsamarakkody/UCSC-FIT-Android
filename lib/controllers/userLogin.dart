import 'dart:convert';
import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthController extends GetxController {
  static var client = http.Client();
  var _islog = false.obs;
  var user = "".obs;
  var uname = "".obs;
  var eMail = "".obs;
  var userRole = "".obs;
  var email = "".obs;
  var role = "".obs;
  var token = "".obs;
  var proPic = "".obs;
  var propic = "".obs;
  var isLoading = false.obs;
  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uname.value = prefs.getString('name');
    propic.value = prefs.getString('proPic');
    eMail.value = prefs.getString('email');
    userRole.value = prefs.getString('rolename');

    super.onInit();
  }

  userLogin(var username, var password) async {
    Map data = {
      "name": username,
      "password": password,
    };
    await client
        .post('http://fit.bit.lk/api/login', body: data)
        .then((res) async {
      if (res.statusCode == 200) {
        var jsonString = json.decode(res.body);

        _islog.value = jsonString['islogin'];
        token.value = jsonString['token'];
        user.value = jsonString['name'];
        email.value = jsonString['email'];
        role.value = jsonString['rolename'];
        proPic.value = jsonString['profile'];

        print(proPic.value);
      } else {
        isLoading.value = false;
        return false;
      }
    }).catchError((onError) {
      print(onError);
      return false;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token.value);
    prefs.setString('name', user.value);
    prefs.setString('email', email.value);
    prefs.setString('rolename', role.value);
    prefs.setString('proPic', proPic.value);
    uname.value = prefs.getString('name');
    propic.value = prefs.getString('proPic');
    eMail.value = prefs.getString('email');
    userRole.value = prefs.getString('rolename');

    return _islog.value;
  }

  Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await client.post(
      'http://fit.bit.lk/api/logout',
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${prefs.getString('token')}"
      },
    ).then((res) async {
      if (res.statusCode == 200) {
        var jsonString = json.decode(res.body);

        _islog.value = jsonString['islogin'];
      } else {
        isLoading.value = false;
        return null;
      }
    }).catchError((onError) {
      print(onError);
    });

    prefs.remove('token');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('rolename');
    prefs.remove('proPic');
    uname.value = '';
    eMail.value = '';
    userRole.value = '';
    propic.value = '';
  }
}
