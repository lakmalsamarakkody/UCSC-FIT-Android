

import 'package:MobileProject/componet/activityInticator.dart';
import 'package:MobileProject/componet/appBarComponet.dart';
import 'package:MobileProject/componet/drawerComponet.dart';
import 'package:MobileProject/controllers/searchStudents.dart';
import 'package:MobileProject/screen/stduentDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
      
      SearchStudentsController searchStudentsController=Get.put(SearchStudentsController());
      TextEditingController searchController=TextEditingController();
      List<dynamic>newList;
      
      SearchBar searchBar;
      AppBar buildAppBar(BuildContext context){
        return AppBar(
          backgroundColor: Color.fromRGBO(15, 61, 84,1),
          iconTheme: IconThemeData(color: Colors.white),
          title:Text("Search Students"),
          actions:[searchBar.getSearchAction(context)]
        );
      }
      _StudentProfileState() {
        searchBar=SearchBar(
          clearOnSubmit: false,
          closeOnSubmit: false,
          hintText:"Searching",
          setState: setState,
          controller:searchController,
          inBar: false,
          onChanged:(String value){
        
            searchStudentsController.fetchSearchStudnetsbyname(value);

          } ,
          onCleared: (){
            searchStudentsController.fetchSearchStudnets();
          },
          
         buildDefaultAppBar: buildAppBar
         );
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: searchBar.build(context),

   
       body:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
                  Obx(()=>
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           children: [
                                             FlatButton.icon(
                      onPressed: ()=>searchStudentsController.stateChage("Reg No"),
                     label:Text("Reg No", style:searchStudentsController.searchType.value=="Reg No"?TextStyle(
                       color: Colors.yellow
                     ) :TextStyle(),),
                     icon: searchStudentsController.searchType.value=="Reg No" ?
                     Icon(Icons.check_sharp,color: Colors.yellow,):Icon(Icons.search_off),
                     color: searchStudentsController.searchType.value=="Reg No" ?Colors.blue:Colors.grey,
                      shape:RoundedRectangleBorder
                      (borderRadius:BorderRadius.circular(20.0),
                      side: BorderSide(color: searchStudentsController.searchType.value=="Reg No" ?Colors.blue:Colors.grey,)
                      
                       )
                     ),
                     SizedBox(width:10),
                       FlatButton.icon(
                      onPressed: ()=>searchStudentsController.stateChage("Name"),
                      label:Text("Name",style:searchStudentsController.searchType.value=="Name"?TextStyle(
                       color: Colors.yellow
                     ) :TextStyle(),),
                      icon: searchStudentsController.searchType.value=="Name" ?Icon(Icons.check_sharp,color: Colors.yellow,):Icon(Icons.search_off),
                     color: searchStudentsController.searchType.value=="Name" ?Colors.blue:Colors.grey,
                      shape:RoundedRectangleBorder
                      (borderRadius:BorderRadius.circular(20.0),
                      side: BorderSide(color: searchStudentsController.searchType.value=="Name" ?Colors.blue:Colors.grey,)
                      
                       )
                     ),
                                           ],
                                         ),
                                       ),
                  ),
                  
               Expanded(
                      child: Obx(()=>RefreshIndicator( onRefresh:  () async{
          
                   await Future.delayed(Duration(seconds: 2));
                         SharedPreferences prefs = await SharedPreferences.getInstance();
                  var token = prefs.getString('token');
                  print(token);
                        
                      searchStudentsController.fetchSearchStudnets();   
             },
                                             child:searchStudentsController.isLoading.value==false?Center(child: ActivityInticator()):
                                             ListView.builder(
                    itemCount:searchStudentsController.searchstudentList.length,
                   itemBuilder: (BuildContext context, int index) {
                        return  Container(
                               margin:EdgeInsets.only(left:5,right:5,bottom: 10,top:10),
                                    decoration: BoxDecoration(
                              border: Border.all(
                           color: Colors.black,
                              ),
                             ), 
                                    
                              child: ListTile(
                               
                                mouseCursor: MouseCursor.defer,
                                focusColor: Colors.red,
                               // tileColor: index%2==0? Color.fromRGBO(84, 150, 16,.6):Color.fromRGBO(84, 133, 150, .6),  
                                autofocus: true,
                                leading: Text("${index+1}"),
                                trailing: Icon(Icons.keyboard_arrow_right,
                                  semanticLabel: "click",
                                ),
                              title: Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: 10,),
                                   
                                  Text('${searchStudentsController.searchstudentList[index].fullName}', style:TextStyle(color:Colors.black)),
                                   SizedBox(height: 20,),
                                  Text('${searchStudentsController.searchstudentList[index].regNo}', style:TextStyle(color:Colors.black)),
                                   SizedBox(height: 10,),
                                ],
                              ),
                             
                              onTap: (){
                                Get.to(StudentDetais(index:index,
                                color:index%2==0? Color.fromRGBO(84, 150, 16,.8):Color.fromRGBO(84, 133, 150, .8), 
                                examColor:index%2==1? Color.fromRGBO(84, 150, 16,.8):Color.fromRGBO(84, 133, 150, .8) ,
                                ));
                                print(searchStudentsController.searchstudentList[index].id);
                                searchStudentsController.fetchStudentResult(searchStudentsController.searchstudentList[index].id);
                              },
                            ),
                          );
                     },
                  
                 ),
                                            )
                                            
                      ),
               ),
             ],
           ),
         ),
       
    );
  }
}
