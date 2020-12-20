import 'package:flutter/material.dart';

class DropdownTimer extends StatefulWidget {
  @override
  _DropdownTimerState createState() => _DropdownTimerState();
}

class _DropdownTimerState extends State<DropdownTimer> {
  int dropdownValue = 5;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      onChanged: (int newValue){
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <int>[5,10,15,20,25].map<DropdownMenuItem<int>>((int e){
        return DropdownMenuItem(
            value: e,
            child: Text('$e minutes'),
        );
      }).toList(),
    );
  }
}
