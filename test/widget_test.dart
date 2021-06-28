

import 'package:MobileProject/controllers/examSchedule.dart';
import 'package:MobileProject/screen/stduentDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
   testWidgets("StudnetDetails has  name and", (WidgetTester tester)async{

     await tester.pumpWidget(StudentDetais(index:2,color:Colors.red,examColor: Colors.amber,) );
   });
  
}