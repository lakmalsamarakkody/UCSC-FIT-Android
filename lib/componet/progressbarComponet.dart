



import 'package:MobileProject/controllers/regstudents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepProgress extends StatelessWidget {
  Color co1;
  Color co2;
  final Color color;
  final int cStep;
  final int toStep;
  final String subjectName;
  final String update;
  final String examdate;
 String mon;
 DateFormat month = DateFormat('MMMM');
 RegStudentsController regStuController=Get.put(RegStudentsController());
  StepProgress({Key key ,this.cStep,this.toStep,this.subjectName,this.color,this.update,this.examdate}):super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    double pre=(cStep/toStep)*100;
     
    if(pre<40){
      co1=Color.fromRGBO(196, 146, 8, 1);
      co2=Colors.yellow;
    }
    else if(pre>=40 && pre<80){
      co2=Colors.cyan;
      co1=Color.fromRGBO(4, 138, 143, 1);
    }
    else if(pre>=80){
      
      co1=Color.fromRGBO(163, 13, 5, 1);
      co2=Colors.red;
    }
    return Column(
       crossAxisAlignment:CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
         SizedBox(height:20),
        Text(subjectName,style: TextStyle(fontWeight: FontWeight.bold,color:color),),
         SizedBox(height:20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
             examdate!=null?
        Text("exam date : $examdate",style: TextStyle(color:color,)):Container(width: 0,height: 0,),
        SizedBox(height:20),
         
           
        Text("Last Update : $update",style: TextStyle(color:color),),
          
         
    
          ]
        ),
            SizedBox(height:20),
        Container(
          width: (size.width)*3/4,
          child:StepProgressIndicator(
        totalSteps:100,
        currentStep:pre.toInt(), 
        size: 15,
        padding: 0,
        selectedColor:co1,
        unselectedColor: Colors.cyan,
        roundedEdges: Radius.circular(20),
        selectedGradientColor:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [co1, co2],
        ), 
        unselectedGradientColor: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey[200],Colors.grey[500]],
        ),
)
        ),
         SizedBox(height:20,),
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
                   regStuController.fetchRegDetails(y:(date.year).toString(),
                     month:(date.month).toString(),
                     monString: mon
                     );
                     
                   
                     
                  }
                }).catchError((onError){
                  print(onError);
                });
         }, title:Obx(()=>Text("${regStuController.monStr.value} ${regStuController.selectY.value}",style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold))
         )
       
         

          ),
        Text("$cStep/$toStep", style:TextStyle(fontWeight: FontWeight.bold,color: color),),
        
        SizedBox(height:30,),
        
      ],
    );
  }
}