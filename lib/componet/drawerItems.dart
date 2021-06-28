



import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DrawerItem extends StatelessWidget {
   IconData icon;
   String title;
    var page;

   DrawerItem({Key key, this.icon,this.title,this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
          ListTile(
                      
                  leading:Icon(icon,color: Color.fromRGBO(9, 163, 3,1),),
                 title:Text(title,style:TextStyle(color: Color.fromRGBO(9, 163, 3,1))),
                 onTap: (){
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>page)
                );
                  //Navigator.of(context).pop();
                 },
               );
  }
}

// Widget drawerItem({IconData icon, String title, var page,}){

  

//    return 
   
  
// }