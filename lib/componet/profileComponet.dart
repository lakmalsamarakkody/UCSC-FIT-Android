

import 'package:MobileProject/auth/LoginPage.dart';
import 'package:MobileProject/controllers/regstudents.dart';
import 'package:MobileProject/controllers/userLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileComponet extends StatelessWidget {
    UserAuthController userAuthController=Get.put(UserAuthController());
     RegStudentsController regController=Get.put(RegStudentsController());
   ProfileComponet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
              leading: Icon(Icons.person,color: Color.fromRGBO(9, 163, 3,1),),
            title: Text("profile",style:TextStyle(color: Color.fromRGBO(9, 163, 3,1))),
               children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                         margin: EdgeInsets.all(15),
                           width:30,
                           height:30,
                       
                        child:  ClipRRect(
                             borderRadius: BorderRadius.circular(25.0),
                                                  child: FadeInImage(
                     placeholder: const AssetImage('assets/images/default.jpg'),
                     image: NetworkImage(userAuthController.propic.value),
                     imageErrorBuilder: (context,url,error)=>Image.asset("assets/images/default.jpg"),
                      fit: BoxFit.contain,
                      width: 30,
                    height: 30,
                      ),
                        ),
                      ),
                    
                      Text("${userAuthController.uname.value}",style:TextStyle(color:Color.fromRGBO(9, 163, 3,1)))
                    ],
                    
                  ),
                   
                     ListTile(
                      leading:Icon(Icons.email,color: Color.fromRGBO(9, 163, 3,1),),
                      title:Text("${userAuthController.eMail.value}",
                      style:TextStyle(color:Color.fromRGBO(9, 163, 3,1))),
                    ),
                    ListTile(
                      leading:Icon(Icons.assignment_ind,color:Color.fromRGBO(9, 163, 3,1), ),
                      title:Text("${userAuthController.userRole.value}",
                      style:TextStyle(color:Color.fromRGBO(9, 163, 3,1))),
                      
                    ),
                    
               ],
            );
 
  }
}