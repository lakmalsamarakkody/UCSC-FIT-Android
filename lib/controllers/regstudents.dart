import 'dart:convert';
import 'dart:io';

import 'package:MobileProject/controllers/userLogin.dart';
import 'package:MobileProject/models/activestuent.dart';
import 'package:MobileProject/models/currentexam.dart';
import 'package:http/http.dart' as http;

import 'package:MobileProject/models/regstudents.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegStudentsController extends GetxController {
  @override
  void onInit() {
    fetchRegDetails();
    fetchactiveStudent();
    fetchCurrentExam();
    selectY = DateTime.now().year.obs;
    monStr = DateFormat('MMMM').format(DateTime.now()).obs;
    super.onInit();
  }

  var regstudent = List<RegStudent>().obs;
  var isLoading = false.obs;

  var rSC = 0.obs; //Regsited student count
  var year = DateTime.now().year.obs;
  var activemap = Map<String, double>().obs;
  var activeList = ActiveStudent().obs;
  var currentList = List<CurrentExam>().obs;
  var cuList = Map<String, double>().obs;
  var updateAt = ''.obs;
  var udate = ''.obs;
  var uname = "".obs;
  var eMail = "".obs;
  var userRole = "".obs;
  var propic = "".obs;
  var selectY = DateTime.now().year.obs;
  var monStr = DateFormat('MMMM').format(DateTime.now()).obs;
  static var client = http.Client();

  Future fetchRegDetails(
      {String y = "0", String month = "", String monString = ""}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    uname.value = prefs.getString('name');
    eMail.value = prefs.getString('email');
    userRole.value = prefs.getString('rolename');
    propic.value = prefs.getString('proPic');
    if (y == "0") {
      selectY.value = DateTime.now().year;
    }
    if (monString == "") {
      monStr.value = DateFormat('MMMM').format(DateTime.now());
    } else {
      selectY.value = int.parse(y);
      monStr.value = monString;
    }

    await client.get(
      'http://fit.bit.lk/api/reguserCount/$y/$month',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        var jsonString = jsonDecode(res.body);
        //   print(res.body);
        // print('value:$jsonString');
        //  print(' ${UserAuthController.token.value}');
        isLoading.value = true;
        // var reglist= regStudentFromJson(jsonString);
        if (jsonString['Data'] != null) {
          rSC.value = jsonString['yearReg'];
          //print(rSC.value);
          year.value = jsonString['Data']['reg_year'];
          updateAt.value = jsonString['Data']['updated_at'];
          //    print(year.value);
          // print(updateAt.value);
        } else {
          rSC.value = jsonString['yearReg'];
          //   print(rSC.value);
          year.value = 0;
          updateAt.value = 'not date';
          //  print(year.value);
          //  print(updateAt.value);
        }
      } else {
        isLoading.value = false;
        return null;
      }
    }).catchError((onError) {
      isLoading.value = false;
      print(onError);
    });
  }

  Future fetchactiveStudent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    activemap.clear();
    var token = prefs.getString('token');
    await client.get(
      'http://fit.bit.lk/api/active',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        var jsonString = res.body;
        isLoading.value = true;

        var list = activeFromJson(jsonString);
//print(jsonString);
        activeList.value = list;
        activemap.addAll({
          'Account Pending': activeList.value.pendiig,
          "Account Active": activeList.value.active
        });
        udate.value = activeList.value.updated.updatedAt as String;
      } else {
        isLoading.value = false;
        return null;
      }
    }).catchError((onError) {
      isLoading.value = false;
      print(onError);
    });
  }

  Future fetchCurrentExam() async {
    // print(UserAuthController.token.value);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    currentList.clear();
    await client.get(
      'http://fit.bit.lk/api/currentExam',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        isLoading.value = true;
        var jsonString = res.body;
        //  print(jsonString);
        var list = currentexamFromJson(jsonString);
        currentList.assignAll(list);
      } else {
        isLoading.value = false;
        return null;
      }
    }).catchError((onError) {
      isLoading.value = true;
      print(onError);
    });
  }
}
