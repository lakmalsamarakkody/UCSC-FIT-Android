

import 'package:flutter/material.dart';



class OverViewSubject extends StatelessWidget{

     final String subjectName;
     final String subjectCode;
     final int numOfStudent;
     final int pass;
     final int fail;
     final int absent;
     final Color color;

  const OverViewSubject({Key key, this.subjectName, this.subjectCode, this.numOfStudent, this.pass, this.fail, this.absent,this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
       Size size =MediaQuery.of(context).size;
    return  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height:size.height/4,
                    width: double.infinity,
                    
                    decoration: BoxDecoration(
                    
                      color: Colors.white,
                          
                              border: Border.all(
                           color: Colors.black,
                              ),
                     
                    ),
                    
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:[
                            Text(subjectName, style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
                           Text(subjectCode, style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
                            ]
                          ),
                          SizedBox(height:20),
                           Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Text("Number Of Student : $numOfStudent", style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
                             ],
                           ),
                           SizedBox(height:20),
                           Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:[
                              Text("Pass : $pass", style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
                           Text("Fail :  $fail", style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
                           Text("Absent : $absent", style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
                            ]
                          ),
                           
                          
                           
                      ],),
                    ),
                  
                    ),
                );
  }
  
}