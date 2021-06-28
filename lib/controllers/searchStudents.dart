import 'dart:io';

import 'package:MobileProject/controllers/userLogin.dart';
import 'package:MobileProject/models/searchStudents.dart';
import 'package:MobileProject/models/studentsResult.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchStudentsController extends GetxController {
  var searchstudentList = List<StudentsSearch>().obs;
  var resultstudentList = List<StudentResults>().obs;
  var isLoading = false.obs;
  var searchType = "Name".obs;

  @override
  void onInit() {
    fetchSearchStudnets();
    super.onInit();
  }

  static var client = http.Client();
  stateChage(var value) {
    searchType.value = value;
  }

  Future fetchSearchStudnets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await client.get(
      'http://fit.bit.lk/api/searchStudents',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        isLoading.value = true;
        searchstudentList.clear();
        var jsonString = res.body;
        var studentsList = searchStudnetFromJson(jsonString);
        searchstudentList.assignAll(studentsList);
      } else {
        isLoading.value = false;
        return null;
      }
    }).catchError((onError) {
      isLoading.value = false;
      print(onError);
    });
  }

  Future fetchSearchStudnetsbyname(var name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (searchType.value == "Reg No") {
      await client.get(
        'http://fit.bit.lk/api/searchStudentsbyRegNo/$name',
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      ).then((res) {
        if (res.statusCode == 200) {
          isLoading.value = true;
          searchstudentList.clear();
          var jsonString = res.body;
          var studentsList = searchStudnetFromJson(jsonString);
          searchstudentList.assignAll(studentsList);
        } else {
          isLoading.value = false;
          return null;
        }
      }).catchError((onError) {
        isLoading.value = false;
        print(onError);
      });
    } else {
      await client.get(
        'http://fit.bit.lk/api/searchStudentsbyname/$name',
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      ).then((res) {
        if (res.statusCode == 200) {
          isLoading.value = true;
          searchstudentList.clear();
          var jsonString = res.body;
          var studentsList = searchStudnetFromJson(jsonString);
          searchstudentList.assignAll(studentsList);
        } else {
          isLoading.value = false;
          return null;
        }
      }).catchError((onError) {
        isLoading.value = false;
        print(onError);
      });
    }
  }

  Future fetchStudentResult(var id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await client.get(
      'http://fit.bit.lk/api/studentDetails/$id',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        var jsonString = res.body;
        isLoading.value = true;
        var resultList = studnetResultFromJson(jsonString);
        resultstudentList.assignAll(resultList);
        print(resultList.length);
      } else {
        isLoading.value = false;
      }
    }).catchError((onError) {
      isLoading.value = false;
      print(onError);
    });
  }
}
