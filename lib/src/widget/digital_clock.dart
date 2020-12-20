import 'dart:async';

import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  String mae = 'morning';

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if(_timeOfDay.minute != TimeOfDay.now().minute){
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

    if(_timeOfDay.hour > 12 && _timeOfDay.period == DayPeriod.am){
      setState(() {
        mae = 'afternoon';
      });
    }else if(_timeOfDay.period == DayPeriod.pm){
      setState(() {
        mae = 'evening';
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Good \n$mae.', style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
        ),),
        Row(
          children: <Widget>[
            Text('${_timeOfDay.hourOfPeriod}:${_timeOfDay.minute}', style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w200
            ),),
            SizedBox(width: 8,),
            RotatedBox(
              child: Text(_period),
              quarterTurns: 3,
            )
          ],
        ),
      ],
    );
  }
}
