import 'dart:io';

import 'package:MobileProject/componet/barchartresult.dart';
import 'package:MobileProject/controllers/userLogin.dart';
import 'package:http/http.dart' as http;
import 'package:MobileProject/models/resultOverview.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultOverviewController extends GetxController {
  static var client = http.Client();
  var isLoading = false.obs;
  var resultoverList = List<ResultOverviewModel>().obs;
  var point = List<double>().obs;
  var lables = List<String>().obs;
  var isnull = false.obs;

  @override
  void onInit() {
    fetchresult();
    super.onInit();
  }

  Future fetchresult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await client.get(
      'http://fit.bit.lk/api/resultoverview',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        isLoading.value = true;
        var jsonString = res.body;
        point.clear();
        lables.clear();
        var resultList = resultFromJson(jsonString);

        for (int i = 0; i < resultList.length; i++) {
          point.insert(i, (resultList[i].pass).toDouble());
          lables.insert(i, (resultList[i].details.name));
        }

        resultoverList.assignAll(resultList);
      } else {
        isLoading.value = false;
        return null;
      }
    }).catchError((onError) {
      isLoading.value = false;
      print(onError);
    });
  }

  Future fetchresultyear(String year) async {
    int y = int.parse(year);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await client.get(
      'http://fit.bit.lk/api/resultoverview/$y',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        isLoading.value = true;
        var jsonString = res.body;
        point.clear();
        lables.clear();
        var resultList = resultFromJson(jsonString);
        for (int i = 0; i < resultList.length; i++) {
          point.insert(i, (resultList[i].pass).toDouble());
          lables.insert(i, (resultList[i].details.name));
        }

        resultoverList.assignAll(resultList);
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
