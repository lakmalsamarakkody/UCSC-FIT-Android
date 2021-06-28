


import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';


class PieChartComponet extends StatelessWidget {
   final Map<String,double> data;
   final double per;
   final double ab;
   final double regstu;
   bool _loadChart=true;
   final String title;
   final String heldDate;
   final String update;
   final Color cardColor;
   final List<Color> _colors = [
      Color.fromRGBO(189, 8,101,1),
     Color.fromRGBO(18, 8,101,1),
];
   PieChartComponet({Key key, this.data,this.heldDate,this.title,this.update,this.cardColor, this.per, this.ab, this.regstu}):super(key: key);
  @override
  Widget build(BuildContext context) {
   
    return regstu<=0?Text("not value"): Card(
          child: Container(
               margin: EdgeInsets.only(left:10,right: 10,bottom: 10,top:10),
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
               SizedBox(height:20),
               
                  Text("Exam held date : $heldDate",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize:15)),
                   SizedBox(height:20),
                  Text("update date : $update",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize:15)),
             
              _loadChart ?  InkWell(
                           onTap: (){},
                            child:   PieChart(
                              curve:Curves.bounceOut,
                              legendIconShape: LegendIconShape.Circle,
                              maxHeight: 250,
                              maxWidth: 250,
                                          legendTextSize:15,                    
              values: [((per/regstu)*100).round().toDouble(),( 100-(per/regstu)*100).round().toDouble()],
              labels: ["Percent", "Absent"],
              sliceFillColors: [
                Colors.pink[600],
                Colors.indigo[600]
                
              ],
              animationDuration: Duration(milliseconds: 5000),
              legendPosition: LegendPosition.Bottom,
            ),
              ): SizedBox(
height: 150,
),
SizedBox(height: 30,),

  SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}