

import 'package:flutter/material.dart';

class ProgressBarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
             Column(
            children:[
              Icon(Icons.circle,color:Colors.yellowAccent,size:10.0,),
              Text("less than 40 %",style: TextStyle(fontWeight: FontWeight.bold,fontSize:10),)
            ]
          ),
             Column(
            children:[
              Icon(Icons.circle,color:Colors.cyan,size:10.0,),
              Text("more than 40 %",style: TextStyle(fontWeight: FontWeight.bold,fontSize:10))

            ]
          ),
          Column(
            children:[
              Icon(Icons.circle,color:Colors.redAccent,size:10.0,),
              Text("more than 80%",style: TextStyle(fontWeight: FontWeight.bold,fontSize:10))
            ]
          ),
        

         ],
        );
  }
}