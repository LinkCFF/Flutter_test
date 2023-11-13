// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mypetcare/connections/request_options.dart';
import 'package:mypetcare/connections/request_to_api.dart';
import 'package:mypetcare/connections/response_api.dart';
import 'package:mypetcare/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

//Cambiar StatelessWidget por el StatefulWidget
class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
      ),
      body: Column(
        children: [
          TableCalendar(
              selectedDayPredicate: (day) => _selectedDay == day,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                  _selectedDay = selectedDay;
                });
              },
              focusedDay: _focusedDay,
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(Duration(days: 30))),
          TextButton(onPressed: () => {}, child: Text("Agregar Evento"))
        ],
      ),
    );
  }
}
