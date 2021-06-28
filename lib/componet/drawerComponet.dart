
import 'package:MobileProject/auth/LoginPage.dart';
import 'package:MobileProject/componet/EventCalender.dart';
import 'package:MobileProject/componet/drawerItems.dart';
import 'package:MobileProject/componet/profileComponet.dart';
import 'package:MobileProject/controllers/examSchedule.dart';
import 'package:MobileProject/controllers/regstudents.dart';
import 'package:MobileProject/controllers/userLogin.dart';
import 'package:MobileProject/screen/dashboard.dart';
import 'package:MobileProject/screen/resultOverView.dart';

import 'package:MobileProject/screen/studentProfileScreen.dart';
import 'package:MobileProject/screen/subjectSelect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaled_animated_scaffold/scaled_animated_scaffold.dart';


class DrawerComponet extends StatelessWidget {
  RegStudentsController regStuController=Get.put(RegStudentsController());
    UserAuthController userAuthController=Get.put(UserAuthController());

  ExamScheduleController examscheduleController=Get.put(ExamScheduleController());
   DrawerComponet({Key key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

   return ScaledAnimatedScaffold(
      appBar: ScaledAnimatedScaffoldAppBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: Color.fromRGBO(15, 61, 84,1),
        title: Text("Dashboard"),
      ),
      menuConfiguration: ScaledAnimatedScaffoldMenuConfiguration(
        backgroundColor: Color.fromARGB(100,145, 125, 200),
       
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/logo.png"),
             ProfileComponet(),
          Column(
            children:[
              DrawerItem(icon:Icons.search_outlined,title:"Search Student", page:StudentProfile()),
              DrawerItem(icon:Icons.assignment_outlined, title: "Subjects Results",page:SubjectSelect()),
              DrawerItem(icon:Icons.analytics_rounded,title:"Result Overview",page:ChartsDemo()),
             
            ])
          ],
        ),
        footer: IntrinsicHeight(
          child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaledAnimatedScaffoldMenuButton(
                icon:Icon(Icons.power_settings_new,color:Colors.red,size: 35,),
                label: Text('LOG OUT',style: TextStyle(color:Colors.red,fontSize: 15),),
                onPressed: () {

                  
                       
                         userAuthController.logout();
                     
                         Get.offAll(LoginPage());
                },
              ),
            ],
          ),
        ),
      ),
      body: DashBoardScreen()
    
    );

//     return 
// AnimatedDrawer(
// // //homePageAngle:10,
// // homePageXValue:30,
// // homePageYValue: 20,
// shadowColor: Color.fromRGBO(15, 61, 84, .1),
// backgroundGradient: LinearGradient(
//   begin:Alignment.centerLeft ,
//   end:Alignment.topRight,
// colors: [Colors.grey,Colors.white],),
// menuPageContent: Padding(
// padding: const  EdgeInsets.only(top: 100.0, right: 200),
//         child: ListView(
//      padding:EdgeInsets.zero,
//      children:<Widget>[
    
      
//         Container(
//           height:(size.height)/3,
        
         
//           child:DrawerHeader(
//              decoration: BoxDecoration(
//              color:Color.fromRGBO(15, 61, 84,.5),
//              image: DecorationImage(
//                 image:AssetImage("assets/images/logo.png")
//              ),
//           ),
//                child:Text("")
               
             
           
//           ),
//         ),
         
//          ProfileComponet(),
//           Column(
//             children:[
//               DrawerItem(icon:Icons.search_outlined,title:"Search Student", page:StudentProfile()),
//               DrawerItem(icon:Icons.assignment_outlined, title: "Subjects Results",page:SubjectSelect()),
//               DrawerItem(icon:Icons.analytics_rounded,title:"Result Overview",page:ChartsDemo()),
             
//             ]
              
//             )
           
         
//                ],
//          ),

// ), homePageContent:
//    DashBoardScreen(),
// );
  }
}