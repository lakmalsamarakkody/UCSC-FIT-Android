

import 'package:flutter/material.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';

class ActivityInticator extends StatelessWidget {
  const ActivityInticator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   NutsActivityIndicator(
    radius:20,
    activeColor: Colors.white,
    inactiveColor: Color.fromRGBO(15, 61, 84,1),
    tickCount: 11,
    startRatio: 0.55,
    animationDuration: Duration(seconds:2),
    relativeWidth: 0.5,
);
  }
}