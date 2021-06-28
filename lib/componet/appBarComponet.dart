

import 'package:flutter/material.dart';


class AppBarComponet extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  AppBarComponet({Key key,this.title}) : super(key: key);

  @override
  _AppBarComponetState createState() => _AppBarComponetState();

  @override
 
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _AppBarComponetState extends State<AppBarComponet> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
           title:Text(widget.title,
         
         style:TextStyle(color:Colors.white)
         ),
        
         iconTheme:IconThemeData(
           color:Colors.white
         ),
         backgroundColor: Color.fromRGBO(15, 61, 84,1),
           actions:[
    // IconButton(
    //   icon: Icon(
    //     Icons.clear_sharp,
    //     color: Colors.white,
    //   ),
    //   onPressed: () {
    //  Get.back();
    //   },
    // )
  ],
         );
  }
}