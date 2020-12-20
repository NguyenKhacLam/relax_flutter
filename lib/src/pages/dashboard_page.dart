import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:relax/src/widget/digital_clock.dart';
import 'package:relax/src/widget/stagger_list.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage('assets/bg_light.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0),
              child: Column(
                children: <Widget>[
                  DigitalClock(),
                  SizedBox(height: MediaQuery.of(context).size.height / 4,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      child: StaggerList()
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
