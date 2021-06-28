


import 'package:MobileProject/componet/activityInticator.dart';
import 'package:MobileProject/controllers/subjectDetails.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../componet/appBarComponet.dart';
import '../componet/drawerComponet.dart';

class SubjectResultScreen extends StatelessWidget {
  final String code;
  final String name;
  int ye;
  String mon;
  final int id;
 DateFormat month = DateFormat('MMMM');
 
   SubjectDetailsController subjectDetails=Get.put(SubjectDetailsController());

   SubjectResultScreen({Key key, this.code,this.name,this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Obx(()=>
         Scaffold(
       
        appBar: AppBarComponet(title:"$name",),
        body:  
          Padding(
          padding:EdgeInsets.all(20) ,
          child:Column(
            children:[
        
           ListTile(
            trailing: Icon(Icons.arrow_drop_down),
           onTap: (){
            
           showMonthPicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 2, 1),
                  lastDate: DateTime(DateTime.now().year,12),
                  initialDate: DateTime.now(),
                 
                ).then((date) {
                  if (date != null) {
                    mon=(month.format(date));
                      ye=(date.year);
                      Get.find<SubjectDetailsController>().yearMonthChange(ye, date.month);
                       Get.find<SubjectDetailsController>().fetchSheduleId(id);
                  }
                }).catchError((onError){
                  print(onError);
                });
         }, title:
          
         Text(" ${Get.find<SubjectDetailsController>().mon.value}  ${Get.find<SubjectDetailsController>().year.value} ")
         

          ),
            Text("Exam Schedules"),
            SizedBox(height:20),
             subjectDetails.sheduleList.isEmpty?
           Container(
             height: size.height/6,
             width: size.width,
             child:subjectDetails.isLoading.value==false?Center(child:ActivityInticator()) :Card(
               color:Colors.grey,
               elevation: 2.0,
               child: Padding(
                 padding: EdgeInsets.all(20),
                 child: Column(
                   children:[
                     Text("not exam shedules in this month",style:TextStyle(color:Colors.red,fontWeight: FontWeight.bold)),
                    
                   ]
                 ),
                 )
          
         ),
           ):
          Expanded(
            flex:1,
                      child: ListView.builder(
                        itemCount: subjectDetails.sheduleList.length,
                        itemBuilder:(BuildContext context,int i){
                           return
                           Container(
                             decoration: BoxDecoration(
                               boxShadow: [
                                 BoxShadow(
                                   color:Colors.grey[100],
                                   offset: Offset(0,1),
                                   spreadRadius: 1,
                                   blurRadius: 7,
                                 )
                               ],
                              border: Border.all(
                           color:subjectDetails.sheduleList[i].selected?Colors.blue: Colors.black,
                              ),
                             ),
                             margin: EdgeInsets.only(bottom:10,top:10,left:5,right:5),
                   child: ListTile(
                     selected: subjectDetails.sheduleList[i].selected,
                    hoverColor: Colors.amber,                                     
                         tileColor: Colors.grey[100],
                  
                  title: Text("Exam Type : ${subjectDetails.sheduleList[i].name}",),
                  subtitle: Text("Id : ${subjectDetails.sheduleList[i].id}",),
                  onTap: (){
                    subjectDetails.fetchSubjectResult(id,subjectDetails.sheduleList[i].id);
                    subjectDetails.sheduleList.forEach((element) {
                      element.selected=false;
                     });
                     subjectDetails.sheduleList[i].selected=true;
                    
                  },
                ),
                           );
                        }
            
            ),
          ),
          Divider(height: (size.height)/75,),
          Text("Result"),
         subjectDetails.subresult.isEmpty?
           Container(
             height: size.height/6,
             width: size.width,
             child:subjectDetails.isLoading.value==false?Center(child:ActivityInticator()) :
                Padding(
                 padding: EdgeInsets.all(20),
                 child: Column(
                   children:[
                     Text("select exam shedule",style:TextStyle(color:Colors.red,fontWeight: FontWeight.bold)),
                    
                   ]
                 ),
                 )
          
    
           ):
         Expanded(
           flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView.builder(
                itemCount: subjectDetails.subresult.length,
                itemBuilder: (BuildContext context, int i) {
                             return 
                             
              
                            subjectDetails.isLoading.value==false?Center(child:ActivityInticator()):Column(
                              children: [
                                SizedBox(height:20),
                                Container(
                                
                                   decoration: BoxDecoration(
                              border: Border.all(
                           color: Colors.black,
                              ),
                             ),
                                child: Column(
                                  children:[
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 15.0,top:15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                         Text('FIT $code',
                                           style: TextStyle(color: Colors.black),
                                         ),
                                       
                                        //            Text("${Get.find<SubjectDetailsController>().mon.value}"
                                        //    ,
                                        //      style: TextStyle(color: Colors.white),
                                           
                                        //  ),
                                         Text('Exam Type : ${subjectDetails.subresult[i].type}',
                                           style: TextStyle(color: Colors.black),
                                         ),
                                         Text('ID : ${subjectDetails.subresult[i].sheduleId}',
                                           style: TextStyle(color: Colors.black),
                                         ),
                                        
                                      ],
                                      ),
                                    ),
                                    Text("Student : ${subjectDetails.subresult[i].regStu}"
                                    ,
                                           style: TextStyle(color: Colors.black),
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(bottom: 15.0,top:15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                         Text('Pass : ${subjectDetails.subresult[i].pass}'
                                         ,
                                           style: TextStyle(color: Colors.black),
                                         ),
                                        Text('Fail : ${subjectDetails.subresult[i].fail}'
                                        ,
                                           style: TextStyle(color: Colors.black),
                                        ),
                                          Text('Absent : ${subjectDetails.subresult[i].aB}'
                                          ,
                                           style: TextStyle(color: Colors.black),
                                          ),
                                        
                                      ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 15.0,top:15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                         CircularPercentIndicator(
                    radius: 175.0,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 15.0,
                    percent: ((subjectDetails.subresult[i].pass)/(subjectDetails.subresult[i].notAb)),
                    center: new Text(
                      "${(((subjectDetails.subresult[i].pass)/(subjectDetails.subresult[i].notAb))*100).toInt()}% Pass",
                      style:
                          new TextStyle(color: Colors.black,fontSize: 20.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: Colors.lightBlue,
                    progressColor: Color.fromRGBO(49, 247, 52,1),
                  ),
                                        
                                      ],
                                      ),
                                    ),
                                   
                                  ]
                                )
                         ),
                              ],
                            );
                

                  },
        
        ),
            ),
      ),
     
 
            ] 
          )
          )
      ),
    );
  }
}