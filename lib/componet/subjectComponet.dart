

import 'package:MobileProject/controllers/subjectDetails.dart';
import 'package:MobileProject/screen/subjectResult.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectCardComponet extends StatelessWidget {
   final String subjectName;
   final String subjectCode;
   final int id;
 
  SubjectDetailsController subjectDetails=Get.put(SubjectDetailsController());
   SubjectCardComponet({Key key,this.subjectCode,this.subjectName,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  height:100,
                  width:double.infinity,
                  
                   child:Card(
                     color:Colors.white,
                                        child: Container(
                             decoration: BoxDecoration(
                                border: Border.all(
                             color: Colors.black,
                                ),
                               ),
                        child: ListTile(
                          onTap: (){
                            Get.to(SubjectResultScreen(code:subjectCode,name: subjectName,id:id));
                            subjectDetails.resetValue();
                           subjectDetails.fetchSheduleId(id);
                           //  subjectDetails.fetchSubjectResult(id);
                          },hoverColor:Colors.yellow,
                          title:Text(subjectName, style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 20)),
                          subtitle: Text(subjectCode, style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 20)),
                        ),
                     ),
                   )
                );
                
  }
}