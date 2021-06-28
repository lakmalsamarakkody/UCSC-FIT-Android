import 'dart:convert';
import 'dart:io';

import 'package:MobileProject/controllers/userLogin.dart';
import 'package:MobileProject/models/examSchedule.dart';
import 'package:MobileProject/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExamScheduleController extends GetxController {
  var isLoading = false.obs;
  var examScheduleList = List<ExamSchedule>().obs;
  RemoteServices remoteServices = RemoteServices();

  @override
  void onInit() {
    fetchExamSchedule();
    super.onInit();
  }

  //  Future fetchExamSchedule () async{

  //     isLoading(true);
  //   var scheduleData=await remoteServices.fetchExamSchedule();
  //      print(scheduleData);
  //    // print(remoteServices.a());
  //  print(await remoteServices.fetchExamSchedule());
  //   //  print(scheduleData);
  //   // if(scheduleData!=null){

  //   //     print("fflflkfjkls");

  //   //    // ignore: invalid_use_of_protected_member
  //   //    // ignore: deprecated_member_use

  //   // examScheduleList.assignAll(scheduleData);
  //   //    print("ffffffff");
  //   // }
  //   isLoading(false);
  //  }
  static var client = http.Client();

  // ignore: missing_return
  Future fetchExamSchedule() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await client.get(
      'http://fit.bit.lk/api/examSchedule',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    ).then((res) {
      if (res.statusCode == 200) {
        // print(res.body);
        var jsonString = json.decode(res.body);

        isLoading.value = true;

        var schedule = schedulesFromJson(json.encode(jsonString['Data']));

        examScheduleList.assignAll(schedule);
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
