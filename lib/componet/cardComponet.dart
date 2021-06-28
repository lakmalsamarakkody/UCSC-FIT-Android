
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardComponet extends StatelessWidget {
    final double h;
    final  double w;
    final int value;
    final String title;
    final page;
  const CardComponet({Key key,this.h, this.w,this.title,this.value,this.page=null}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                   height:h,
                    width:w,
                    child:Card( color:Colors.grey[100],
                    child: ListTile(
                     contentPadding: EdgeInsets.all(25),
                      title:Column(
                        children: [
                          Text("$title" ,style:TextStyle(color: Colors.white,fontSize: 17)),
                          SizedBox(height:15),
                          Text("$value" ,style:TextStyle(color: Colors.white,fontSize: 17)),
                        ],
                      ),
                      onTap: (){
                        page!=null?
                        Get.to(page):null;
                      },
                    ),
                      elevation: 20,
                     shadowColor: Colors.blue,
                    )
                  );
  }
}