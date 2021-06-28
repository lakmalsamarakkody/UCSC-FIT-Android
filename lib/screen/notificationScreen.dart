

import 'package:MobileProject/componet/appBarComponet.dart';
import 'package:MobileProject/componet/notificationComponet.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponet(title: "Notifications",),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            NotificationComponet(),
            NotificationComponet(),       
            NotificationComponet(),
          ],
        ),
      ),
    );
  }
}