

import 'package:MobileProject/componet/appBarComponet.dart';
import 'package:flutter/material.dart';

class NotificationComponet extends StatelessWidget {
   final String name;
   final String regNo;
   var page;
   NotificationComponet({Key key, this.name,this.regNo,this.page}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
      
            InkWell(
              onTap: (){},
                          child: Column(
                            children: [
                              Container(
                   width:double.infinity,
                    height: MediaQuery.of(context).size.height/4,
                    margin: EdgeInsets.only(top:10,bottom: 10),
                   decoration: BoxDecoration(
                     borderRadius:BorderRadius.only(
                      bottomRight:Radius.circular(50),
                       bottomLeft: Radius.circular(50),
                       
                       ),
                       color: Colors.grey[300],
                      
                      
                       
                   ),
                        
                child:Padding(
                  padding: const EdgeInsets.only(left:30.0,top:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Text("Title  ",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height:20),
                     
                      Column(
                        children:[
                          Text("Reg No :"),
                          Text("Student Name :"),
                          Text("Registed Date :"),
                        ]
                      )

                       
                     
                    ],
                  ),
                ),
              
     
      
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
       Text("9 hours ago",style: TextStyle(fontWeight: FontWeight.bold),),
       Text("9/12/2020",style: TextStyle(fontWeight: FontWeight.bold),)
    ],)
                            ],
                          ),
            );
  }
}