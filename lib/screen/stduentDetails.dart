


import 'package:MobileProject/componet/activityInticator.dart';
import 'package:MobileProject/componet/appBarComponet.dart';
import 'package:MobileProject/componet/drawerComponet.dart';
import 'package:MobileProject/controllers/searchStudents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDetais extends StatelessWidget {
  final double circleRadius = 100.0;
final double circleBorderWidth = 8.0;
  int index;
  Color color;
  Color examColor;
SearchStudentsController searchStudentsController=Get.put(SearchStudentsController());
 StudentDetais({Key key, this.index,this.color,this.examColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Obx(()=>
            Scaffold(
         appBar: AppBarComponet(
           title:"${searchStudentsController.searchstudentList[index].firstName}  ${searchStudentsController.searchstudentList[index].lastName}",
          
         ),
      
         body:Padding(
           padding: const EdgeInsets.all(20.0),
           child: Stack(
  alignment: Alignment.topCenter,
  children: <Widget>[
         Positioned(
           top:size.height/17,
                  child: Container(
        width:size.width*9/10 ,
        height:size.height/8,
       
        child: Card(
            elevation: 20,
             color:color,
        ),
      ),
         ),
      Container(
        width: circleRadius,
        height: circleRadius,
        decoration:
              ShapeDecoration(shape: CircleBorder(), color: Colors.white),
        child: Padding(
            padding: EdgeInsets.all(circleBorderWidth),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1900&q=80',
                      ))),
            ),
        ),
      ),
       Positioned(
         top:size.height/4,
              child: Container(
           width: size.width*9/10,
          height: size.height*2/4,
           
           child: ListView(
             children: [
               Card(
                   elevation: 20.0,
                   color:color,
                    child:Padding(
                      padding:EdgeInsets.all(10),
                      child:
                     
                     Column(
                         mainAxisAlignment:MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                            Text("Personal Information",style:TextStyle(color:Colors.white,fontSize:30.0),),
                            SizedBox(height: 20.0,),
                          
                           Icon(Icons.person_pin_circle_sharp,color: Colors.white,),
                           Text("${searchStudentsController.searchstudentList[index].fullName}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                            SizedBox(height: 10.0,),
                           Icon(Icons.location_on_sharp,color: Colors.white,),
                             Text("${searchStudentsController.searchstudentList[index].perHouseNo}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                             Text("${searchStudentsController.searchstudentList[index].perHouseAddline1}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                             Text("${searchStudentsController.searchstudentList[index].perHouseAddline2}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                             Text("${searchStudentsController.searchstudentList[index].perHouseAddline3}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                             Text("${searchStudentsController.searchstudentList[index].perHouseAddline4}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                            SizedBox(height: 10.0,),
                            Icon(Icons.call_sharp,color: Colors.white,),
                             Text("+${searchStudentsController.searchstudentList[index].telephonecode}${searchStudentsController.searchstudentList[index].telephone} ",style:TextStyle(color:Colors.white,fontSize:20.0),),
                            SizedBox(height: 10.0,),
                             Icon(Icons.streetview_sharp,color: Colors.white,),
                           Text("${searchStudentsController.searchstudentList[index].cityShip} ",style:TextStyle(color:Colors.white,fontSize:20.0),),
                            SizedBox(height: 10.0,),
                             Icon(Icons.calendar_today_sharp,color: Colors.white,),
                           Text("${searchStudentsController.searchstudentList[index].regYear}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                            SizedBox(height: 10.0,),
                          Icon(Icons.how_to_reg_sharp,color: Colors.white,),
                           Text("${searchStudentsController.searchstudentList[index].regNo}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                            SizedBox(height: 10.0,),
                            Icon(Icons.today_sharp,color: Colors.white,),
                           Text("${searchStudentsController.searchstudentList[index].dob}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                            SizedBox(height: 10.0,),
                          Icon(Icons.perm_contact_calendar_sharp,color: Colors.white,),
                           Text("${searchStudentsController.searchstudentList[index].nic}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                           SizedBox(height: 10.0,),
                           Icon(Icons.wc_sharp,color: Colors.white,),
                           Text("${searchStudentsController.searchstudentList[index].gender}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                           SizedBox(height: 10.0,),
                          SizedBox(height: 30.0,),
                            Text("Education Information",style:TextStyle(color:Colors.white,fontSize:30.0),),
                              SizedBox(height:20),
                              Row(
                               children: [
                                  Text("${searchStudentsController.searchstudentList[index].education}",style:TextStyle(color:Colors.white,fontSize:20.0),),
                               ],
                            ),
                            SizedBox(height:20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                  Text("BIT Eligibility",style:TextStyle(color:Colors.white,fontSize:20.0),),
                                  Icon(
                                    searchStudentsController.searchstudentList[index].bitE==1?
                                    Icons.check_box_outlined:Icons.cancel_presentation_sharp, 
                                    color:searchStudentsController.searchstudentList[index].bitE==1?
                                    Color.fromRGBO(3, 252, 33, .9):Color.fromRGBO(252, 7, 3, .9),
                                    size:30,
                                    )
                               ],
                            ),
                            SizedBox(height:20),
                            Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                  Text("FIT Certificate",style:TextStyle(color:Colors.white,fontSize:20.0),),
                                   Icon(
                                    searchStudentsController.searchstudentList[index].fitCert==1?
                                    Icons.check_box_outlined:Icons.cancel_presentation_sharp, 
                                    color:searchStudentsController.searchstudentList[index].fitCert==1?
                                    Color.fromRGBO(3, 252, 33, .9):Color.fromRGBO(252, 7, 3, .9),
                                    size:30,
                                    )
                               ],
                            ),
                            SizedBox(height: 30.0,),
                            Text("Exam Information",style:TextStyle(color:Colors.white,fontSize:30.0),),
                            SizedBox(height: 20.0,),
                              searchStudentsController.isLoading.value==false?Center(child: ActivityInticator()): SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                                    child: Card(
                                       margin: EdgeInsets.all(10),
                                     color: examColor,
                                      elevation: 30,
                                      shadowColor: Colors.blue,
                                      child: Row(
                      
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                             
                        DataTable(  
                          headingTextStyle: TextStyle(color:Colors.white,fontFamily:'CASTELAR'),
                         
  columns: [  
         DataColumn(label:Text("Subject code") ),  
          DataColumn(label:Text("Subject Name") ),  
          DataColumn(label:Text("Date") ),
          DataColumn(label:Text("Result") ),
               DataColumn(label:Text("Marks") ),

  ],  
  rows: 
      searchStudentsController.resultstudentList
      .map(
         (element)=>DataRow(cells:<DataCell> [  
        DataCell( Text("${element.code}",style: TextStyle(color:Colors.white),)),  
        DataCell( Text("${element.name}",style: TextStyle(color:Colors.white),)),
        DataCell( Text("${element.date}",style: TextStyle(color:Colors.white),)),    
        DataCell( Text(element.result==0?"Fail":"Pass",style: TextStyle(color:Colors.white),)),
         DataCell( Text("${element.mark}",style: TextStyle(color:Colors.white),)),


      ]
      ),
      )
      
   .toList()  
      
       
   
),

                       ],
                       ),
                                    ),
                    )
 
                        ]
                      )
                      ),
                    ),
             ],
           ),
           
         ),
       ),
      Padding(
        padding: EdgeInsets.only(top: circleRadius / 2.0),
        child: Container(
            // Some content
        ),
      ),
  ],
),
         )
      ),
    );
  }
}