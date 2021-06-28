

import 'package:MobileProject/componet/activityInticator.dart';
import 'package:MobileProject/componet/appBarComponet.dart';
import 'package:MobileProject/componet/drawerComponet.dart';
import 'package:MobileProject/componet/subjectComponet.dart';
import 'package:MobileProject/controllers/subjectDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectSelect extends StatelessWidget {

    SubjectDetailsController subjectDetails=Get.put(SubjectDetailsController());
   SubjectSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBarComponet(title:"Subjects",),
    
      body:subjectDetails.isLoading.value==false?  Center(child: 
      IconButton(onPressed:()async{
                                                await Future.delayed(Duration(seconds: 2));
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                               var token = prefs.getString('token');
                                       print(token);
                        
                              subjectDetails..fetchSubjectDetails();
                                             },
                                            icon:Icon(Icons.refresh_outlined,color: Colors.red,)
                                              ))
      :  Container(
        margin: EdgeInsets.all(25),
         child:Obx(()=>   ListView.builder(
                      itemCount:subjectDetails.subjectDetailsList.length,
                      itemBuilder:(BuildContext context, i){
                        return   Column(
                          children: [
                            SubjectCardComponet(
                              subjectName:"${subjectDetails.subjectDetailsList[i].name}",
                               subjectCode:"${subjectDetails.subjectDetailsList[i].code}",
                               id:subjectDetails.subjectDetailsList[i].id,
                               //code:subjectDetails.subjectDetailsList[i].code,
                               ),
                                SizedBox(height: 25,),
                          ],
                        );
                      }
               
           ),
           )
                  
         )
      )
    ;
  }
}