

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class RegisterdStudetComponet extends StatelessWidget {
  final Map<String,double> data;
   bool _loadChart=true;
   final String title;
   final String update;
   final String regStudent;
   final String activeStudent;
   final Color cardColor;
   final List<Color> _colors = [
    
     Color.fromRGBO(190, 252,3,1),
    Color.fromARGB(200,50, 122,190),
];
   RegisterdStudetComponet({Key key, this.data,this.title,this.update,this.cardColor, this.regStudent, this.activeStudent}):super(key: key);
  @override
  Widget build(BuildContext context) {
   
    return data.isEmpty?Center(child:Text("not data")): Card(
          child: Container(
        margin: EdgeInsets.all(10),
           
                decoration: BoxDecoration(
                                border: Border.all(
                             color: Colors.black,
                                ),
                               ),
        child: Padding(
          padding: EdgeInsets.all(10),
                child: Column(
            
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 30,),
               Text(title,style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize:20)),
               SizedBox(height:10),
               AspectRatio
               (
                 aspectRatio: 34/9,
                              child: Column(
                    children:[
                    Text("Registered Student : $regStudent ",style:TextStyle(color:Colors.blue,fontSize:20)),
                     
                    ]
                 ),
               ),
                   
                SizedBox(height:20),
             
              _loadChart ?  PieChart(
dataMap: data,

colorList:
_colors, // if not declared, random colors will be chosen
animationDuration: Duration(milliseconds: 1500),
chartLegendSpacing: 20.0,
chartRadius: MediaQuery.of(context).size.width /
2.5, //determines the size of the chart
showChartValuesInPercentage: false,
showChartValues: true,
showChartValuesOutside: true,
chartValueBackgroundColor: Colors.grey[200],
showLegends: true,
legendPosition:
LegendPosition.right, //can be changed to top, left, bottom
decimalPlaces: 1,
showChartValueLabel: true,
initialAngle: -83.0,
chartValueStyle: defaultChartValueStyle.copyWith(
color: Colors.blueGrey[900].withOpacity(1),
),
chartType: ChartType.disc, //can be changed to ChartType.ring

): SizedBox(
height: 150,
),
SizedBox(height: 30,),
Text("Last update : $update",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize:15)),
  SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}