// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mypetcare/connections/request_options.dart';
import 'package:mypetcare/connections/request_to_api.dart';
import 'package:mypetcare/connections/response_api.dart';
import 'package:mypetcare/main.dart';
import 'package:mypetcare/pages/create_event.dart';
import 'package:mypetcare/pages/show_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Cambiar StatelessWidget por el StatefulWidget
class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.principal);
          },
        ),
        title: Text('Lista de eventos'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListaCitas(),
              TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateEvent())),
                  child: Text("Ir al Calendario"))
            ],
          ),
        ),
      ),
    );
  }
}
