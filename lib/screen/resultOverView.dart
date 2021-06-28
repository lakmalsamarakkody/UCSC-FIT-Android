import 'dart:io';

import 'package:MobileProject/componet/activityInticator.dart';
import 'package:MobileProject/componet/appBarComponet.dart';

import 'package:MobileProject/componet/drawerComponet.dart';
import 'package:MobileProject/componet/resultoverviewsubjects.dart';
import 'package:MobileProject/controllers/resultoverview.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_chart/chart/bar/bar_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
 
class ChartsDemo extends StatelessWidget {
  //
  ChartsDemo() : super();
 
  final String title = "Charts Demo";


   
  final List<Color> col=[
     Colors.yellow,
     Colors.green,
     Colors.teal
  ];
 ResultOverviewController resultoverviewController=Get.put(ResultOverviewController());
  


 
 
 
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return 
           Obx(()=>
                        Scaffold(
        appBar: AppBarComponet(title: "Result Overviews",),
      
        body:resultoverviewController.isLoading.value==false?Center(child:
                                             IconButton(onPressed:()async{
                                                await Future.delayed(Duration(seconds: 2));
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                               var token = prefs.getString('token');
                                       print(token);
                        
                               resultoverviewController.fetchresult(); 
                                             },
                                            icon:Icon(Icons.refresh_outlined,color: Colors.red,)
                                              ))
        : 
        Column(
          children: [
             
              Expanded(
                          child: resultoverviewController.point[1]==0?
                          Container(
                                height:200,
                               width: 200,
                               margin: EdgeInsets.all(30),
                            child: Text("not value") ,):
                     
                                             Container(
                        padding: EdgeInsets.all(20.0),
                        child:  BarChart(
                          color:Colors.orange,
                          size:Size(size.width*10/11,size.height/2),
                          data:resultoverviewController.point, 
                          labels : resultoverviewController.lables,
                          textScaleFactorXAxis: 1.2,
                          textScaleFactorYAxis: 0.0,
                          
                          ),
                    
                      ),
                

              ),
               Divider(
                height: size.height/35,
              ),
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      items: ["${DateTime.now().year}", "${DateTime.now().year-1}", "${DateTime.now().year-2}"],
      label: "Select Year",
      hint: "Year",
      popupItemDisabled: (String s) => s.startsWith('I'),
      onChanged: (String value){
        print(value);
        resultoverviewController.fetchresultyear(value);

      },
      selectedItem: "select year"),
                 ),
         Divider(
                height: size.height/35,
              ),
              
                             Expanded(
                  child:ListView.builder(
                    itemCount: resultoverviewController.resultoverList.length,
                    itemBuilder: (BuildContext context, int i) { 
                         return
                        OverViewSubject(
                       subjectName: "${resultoverviewController.resultoverList[i].details.name}",
                       subjectCode: "${resultoverviewController.resultoverList[i].details.code}",
                       color: Colors.grey[300],
                      numOfStudent: resultoverviewController.resultoverList[i].regStu,
                      pass:  resultoverviewController.resultoverList[i].pass,
                      fail:  resultoverviewController.resultoverList[i].fail,
                      absent:  resultoverviewController.resultoverList[i].ab,
                     );
                     },
                    
                    ),
                  ),
              
          ],
        ),
    
    ),
            );
  }
}