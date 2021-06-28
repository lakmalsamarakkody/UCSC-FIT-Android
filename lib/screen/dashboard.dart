
import 'dart:math';
import 'dart:ui';

// import 'package:MobileProject/componet/appBarComponet.dart';
import 'package:MobileProject/componet/EventCalender.dart';
import 'package:MobileProject/componet/RegisterdStudet.dart';
import 'package:MobileProject/componet/activityInticator.dart';
import 'package:MobileProject/componet/drawerComponet.dart';
import 'package:MobileProject/componet/pieChartComponet.dart';
import 'package:MobileProject/componet/progressbarComponet.dart';
import 'package:MobileProject/controllers/examSchedule.dart';
import 'package:MobileProject/controllers/regstudents.dart';
import 'package:MobileProject/screen/notificationScreen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatelessWidget {


   RegStudentsController regStuController=Get.put(RegStudentsController());
     ExamScheduleController examscheduleController=Get.put(ExamScheduleController());
   DashBoardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size= MediaQuery.of(context).size;
    return Obx(()=>
               Scaffold(
               
        //    appBar: AppBar(
        //      title:Text("Dashboard",style:TextStyle(color:Colors.white)),
        //      leading: Text(''),
        //        iconTheme:IconThemeData(
        //      color:Colors.white
        //    ),
        //    backgroundColor: Color.fromRGBO(15, 61, 84,1),
        // //     actions: [
        // //       Badge(
        // //           position: BadgePosition.topStart(top:15,start:10),
               
        // //            animationType: BadgeAnimationType.scale,
        // //           shape: BadgeShape.circle,
        // //           alignment: Alignment.bottomLeft,
        // //           toAnimate: true,
        // //           animationDuration:Duration(seconds: 1),
                
        // //                     child: 
        // //  IconButton(
        // //           icon: Icon(
            
        // //     Icons.notifications,
        // //     color: Colors.white,
        // // ),
        // // onPressed: (){
        // //   Get.to(NotificationScreen());
        // // },
        // //  ),
        
  
        // //       )
        // //     ],
        //    ),
          // drawer: DrawerComponet(),
           body:RefreshIndicator(
           
             onRefresh: () async{
          
                   await Future.delayed(Duration(seconds: 2));
                         SharedPreferences prefs = await SharedPreferences.getInstance();
                  var token = prefs.getString('token');
                  print(token);
                  regStuController.fetchCurrentExam();
                   regStuController.fetchRegDetails();
                   regStuController.fetchactiveStudent();
                   examscheduleController.fetchExamSchedule();
                  
             },
                        child: Container(
                  padding: EdgeInsets.only(top:25 ,left:10,right:10 ),
               child: Column(
                 children: [
                 
                   Expanded(
                     child: ListView(

                       children:[
                         
                         regStuController.isLoading.value==false?ActivityInticator(): Card(
                                                    child: Container(
                                   decoration: BoxDecoration(
                                       color: Colors.grey[100],
                                border: Border.all(
                             color: Colors.black,
                                ),
                               ),
                            margin: EdgeInsets.all(10),
                           
                             child: StepProgress(
                               cStep:regStuController.rSC.value,
                               toStep:regStuController.rSC.value<500?500:regStuController.rSC.value+100,
                               subjectName: "Registered Students",
                               color:Colors.black,update:"${regStuController.updateAt}",),
                             ),
                         ),
                          
                      
                         SizedBox(height: 20,),
                         Text("Current Exams"),
                         SizedBox(height: 20,),
                          
                               SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                                      child: regStuController.isLoading.value==false? ActivityInticator(): Row(
                                                        children:regStuController.currentList.map((element) => 
                                                        
                                                        PieChartComponet(
                                                            ab:element.abstu,
                                                            per:element.notAb,
                                                            regstu: element.regStu,
                                                            title: element.details.name,
                                                            update: element.details.update,
                                                            heldDate: element.details.date,
                                                        )
                                                        
                                                        ).toList(),
                                                       
                                                      ),
                               ),
                               
                            
                         SizedBox(height: 20,),
                         
                       Text("Active Information"),
                       regStuController.isLoading.value!=true ?ActivityInticator():  RegisterdStudetComponet(
                           data:regStuController.activemap,
                           title: "Registed Infomation",
                           regStudent:"${regStuController.activeList.value.yearReg}",
                           activeStudent: "${regStuController.activeList.value.active}",
                           update:"${regStuController.udate.value}",

                         ),
                        SizedBox(height: 20,),
                        
                        Text("Exam Schedule"),
                        SizedBox(height: 20,),
                         
                      CalendarApp(),
                       
                     ],
                     
                     ),
                   ),
                           
                 ],
               ),
             ),
           ),
      ),
    );
  }
}