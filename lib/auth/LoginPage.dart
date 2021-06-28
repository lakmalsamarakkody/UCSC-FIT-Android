

import 'package:MobileProject/componet/drawerComponet.dart';
import 'package:MobileProject/controllers/userLogin.dart';
import 'package:MobileProject/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernamecontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  UserAuthController userAuthController=Get.put(UserAuthController());
  final _formKey=GlobalKey<FormState>();
  FocusNode _node=new FocusNode();
  bool _passwordVisble=true;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   
    return Scaffold(
         body:Container(
            height: size.height,
            width: size.width,
            child:ListView(
              children: <Widget>[
               Stack(
                 children: <Widget>[
                   Container(
                     height:size.height,
                     width:(size.width)/2,
                     decoration: BoxDecoration(
                      
                        gradient:LinearGradient(
                      colors:[
                               
                          Color.fromRGBO(105, 125, 133,1),
                            Color.fromRGBO(15, 61, 84,1),
                          ],

                             begin: Alignment.topLeft,
                            end:Alignment(0.8, 0.0),
                         
                       
                          
                          ),
                        borderRadius: BorderRadius.only(
                          topRight:Radius.circular(500),
                          bottomRight: Radius.circular(500)
                          )
                     ),
                   ),
                     Positioned(
                
                 top:(size.height)/25,
                left:(size.width)/18,
                child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                   image:DecorationImage(
                         image:AssetImage('assets/images/fit.png'),
                         fit:BoxFit.contain,
                         colorFilter: ColorFilter.srgbToLinearGamma()
                       ),
                 
                ),
               ),
                ),
                       Positioned(
                
                 top:(size.height)/6,
                 left:(size.width)/6,
                child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                   image:DecorationImage(
                         image:AssetImage('assets/images/logo.png'),
                         fit:BoxFit.contain
                       ),
                 
                ),
               ),
                ),
               
                Positioned(
                  top:(size.height)*2/5,
                  left:(size.width)/4,
                
                  child: Container(
                    height:(size.height)*2/5,
                    width:300,
                  
                    child: Form(
                       key:_formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin:EdgeInsets.only(right:20),
                             child:TextFormField(
                              
                               validator: (value){
                          if(value.isEmpty ||value.trim()==""){
                            return "Please enter your email";
                          }
                          return null;
                        },
                               controller: _usernamecontroller,
                                 textInputAction: TextInputAction.next,
                        onEditingComplete: (){
                          FocusScope.of(context).requestFocus(_node);
                        },
                               decoration: InputDecoration(
                                 errorStyle: TextStyle(color:Color.fromRGBO(184, 97, 4, 1),),
                                 labelStyle:TextStyle(color:Colors.white),
                                   icon:Icon(Icons.person,color: Colors.white,),
                                 hintText:"email",
                                 hintStyle:TextStyle(color:Colors.white),
                                 
                               ),
                             ),
                          ),
                         
                           SizedBox(height:20),
                           Container(
                            margin:EdgeInsets.only(right:20),
                             child:TextFormField(
                               obscureText:_passwordVisble,
                                controller: _passwordcontroller,
                                focusNode: _node,
                                validator: (v){
                          if(v.isEmpty ||v.trim()==""){
                            return "Enter Your Password";

                          }
                         
                        },
                               decoration: InputDecoration(
                                 labelStyle:TextStyle(color:Colors.white),
                                  errorStyle: TextStyle(color:Color.fromRGBO(184, 97, 4, 1),),
                                 hintText:"password",
                                 suffixIcon: IconButton(icon:Icon(_passwordVisble?
                                 Icons.visibility:Icons.visibility_off),onPressed:(){

                                   setState(() {
                                  _passwordVisble ^=true;
                                });
                                 },),
                                 icon:Icon(Icons.lock,color: Colors.white),
                                 hintStyle:TextStyle(color:Colors.white)
                               ),
                             ),
                          ),
                           SizedBox(height:40),
                         
                        ],
                      )
                      ),
                  )
                  ),
                  Positioned(
                    width: (size.width)*2/3,
                    height: 40,
                    bottom: (size.height)/4,
                     left:(size.width)/4,
                    child: RaisedButton(
                            onPressed: () async{
                                  if(_formKey.currentState.validate()) {
                                     SharedPreferences prefs = await SharedPreferences.getInstance();
                            var token = prefs.getString('token');
                            var result= await userAuthController.userLogin(_usernamecontroller.text, _passwordcontroller.text);
                            print(result);
                              // print(userAuthController.islog.value);
                              if(result==true){
                                Get.off(DrawerComponet());
                              }
                              else{
                                Get.snackbar(
                                    
                                  "Authentication failed",
                                   "check username or password",
                                   snackPosition: SnackPosition.BOTTOM,
                                   colorText: Colors.red,
                                   snackStyle: SnackStyle.FLOATING,
                                   dismissDirection: SnackDismissDirection.HORIZONTAL,
                                   duration: Duration(seconds:5),
                                   backgroundColor: Color.fromRGBO(48, 47, 47, 1)
                                   );
                              }
                                  }
                                
                              
                            },
                            color:Color.fromRGBO(15, 61, 84,1),
                            child: Text("LOGIN",style:TextStyle(color:Colors.white)),
                          ) 
                    
                    )
                   
                 ],
               ),
          

              ],
            )
         )

    );
  }
}