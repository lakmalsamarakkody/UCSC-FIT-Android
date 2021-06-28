import 'dart:convert';
import 'dart:io';

import 'package:MobileProject/controllers/userLogin.dart';
import 'package:MobileProject/models/sheduleids.dart';
import 'package:MobileProject/models/subjectDetails.dart';
import 'package:MobileProject/models/subjectResult.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectDetailsController extends GetxController {
  var mon = DateTime.now().month.obs;
  var subjectDetailsList = List<SubjectDetailsModel>().obs;
  var subresult = List<SubjectResult>().obs;
  var sheduleList = List<SheduleId>().obs;
  var year = DateTime.now().year.obs;
  var isLoading = false.obs;
  var examRegStu = 0.obs;
  var passStu = 0.obs;
  var failStu = 0.obs;
  var abStu = 0.obs;
  var passPer = 0.0.obs;

  static var client = http.Client();

  @override
  void onInit() {
    fetchSubjectDetails();

    super.onInit();
  }

  void yearMonthChange(var y, var m) {
    print(m);
    year.value = y;
    mon.value = m;
  }

  Future resetValue() {
    mon.value = DateTime.now().month;
    year.value = DateTime.now().year;
    sheduleList.clear();
    subresult.clear();
  }

  Future fetchSubjectDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    subresult.clear();
    sheduleList.clear();
    await client.get(
      'http://fit.bit.lk/api/subjectDetails',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        isLoading.value = true;
        subjectDetailsList.clear();
        var jsonString = res.body;
        var subDetails = subjectFromJson(jsonString);

        subjectDetailsList.assignAll(subDetails);
      } else {
        isLoading.value = false;
        print("fffff");
      }
    }).catchError((onError) {
      isLoading.value = false;
      print(onError);
    });
  }

  Future fetchSubjectResult(var id, var sheId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    subresult.clear();
    await client.get(
      'http://fit.bit.lk/api/subjectresult/$id/$sheId/${year.value}/${mon.value}',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        isLoading.value = true;
        var jsonString = (res.body);
        print(jsonString);
        var dataList = subjectResultFromJson(jsonString);
        subresult.assignAll(dataList);
      } else {
        isLoading.value = false;
        print("fffff");
      }
    }).catchError((onError) {
      isLoading.value = true;
      print(onError);
    });
  }

  Future fetchSheduleId(var id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    subresult.clear();
    sheduleList.clear();
    await client.get(
      'http://fit.bit.lk/api/fetchscheduleIds/$id/${year.value}/${mon.value}',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        isLoading.value = true;
        var jsonString = (res.body);

        var dataList = sheduleIdFromJson(jsonString);
        sheduleList.assignAll(dataList);
      } else {
        isLoading.value = false;
        print("fffff");
      }
    }).catchError((onError) {
      isLoading.value = true;
      print(onError);
    });
  }
}
