

import 'package:MobileProject/componet/drawerComponet.dart';
import 'package:MobileProject/screen/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'auth/LoginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      print(token);
  runApp(GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
   
        primarySwatch: Colors.red,
        fontFamily:'Spectral',
        primaryColorDark:  Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:(token==null || token=='')?LoginPage():DrawerComponet(),
    ));
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

