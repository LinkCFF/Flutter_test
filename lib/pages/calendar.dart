// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mypetcare/connections/request_options.dart';
import 'package:mypetcare/connections/request_to_api.dart';
import 'package:mypetcare/connections/response_api.dart';
import 'package:mypetcare/main.dart';
import 'package:mypetcare/pages/create_event.dart';
import 'package:mypetcare/pages/show_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mypetcare/components/event_card_item.dart';
import 'package:mypetcare/models/cita.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  // List<Cita> citas = [];
  List<Cita> citas = [
    Cita(
      1, // id
      12, // begin
      "101", // cod
      'Cita 1', // title
      DateTime.now().add(Duration(hours: 1)),
      DateTime.now().add(Duration(hours: 1)),
      1, // description
      // end
      1, // pet_id
      "1", // creator_ID
      true, // event_type
      1, // editable // day_id
    ),
    Cita(
      1, // id
      12, // begin
      "1021", // cod
      'Cita 21', // title
      DateTime.now().add(Duration(hours: 21)),
      DateTime.now().add(Duration(hours: 12)),
      21, // description
      // end
      21, // pet_id
      "21", // creator_ID
      true, // event_type
      2, // editable // day_id
    ),
    Cita(
      1, // id
      12, // begin
      "1021", // cod
      'Cita 21', // title
      DateTime.now().add(Duration(hours: 21)),
      DateTime.now().add(Duration(hours: 12)),
      21, // description
      // end
      21, // pet_id
      "21", // creator_ID
      true, // event_type
      2, // editable // day_id
    ),
    Cita(
      1, // id
      12, // begin
      "1021", // cod
      'Cita 21', // title
      DateTime.now().add(Duration(hours: 21)),
      DateTime.now().add(Duration(hours: 12)),
      21, // description
      // end
      21, // pet_id
      "21", // creator_ID
      true, // event_type
      2, // editable // day_id
    ),
    Cita(
      1, // id
      12, // begin
      "1021", // cod
      'Cita 21', // title
      DateTime.now().add(Duration(hours: 21)),
      DateTime.now().add(Duration(hours: 12)),
      21, // description
      // end
      21, // pet_id
      "21", // creator_ID
      true, // event_type
      2, // editable // day_id
    ),
    Cita(
      1, // id
      12, // begin
      "1021", // cod
      'Cita 21', // title
      DateTime.now().add(Duration(hours: 21)),
      DateTime.now().add(Duration(hours: 12)),
      21, // description
      // end
      21, // pet_id
      "21", // creator_ID
      true, // event_type
      2, // editable // day_id
    ),
    Cita(
      1, // id
      12, // begin
      "1021", // cod
      'Cita 21', // title
      DateTime.now().add(Duration(hours: 21)),
      DateTime.now().add(Duration(hours: 12)),
      21, // description
      // end
      21, // pet_id
      "21", // creator_ID
      true, // event_type
      2, // editable // day_id
    ),
    Cita(
      1, // id
      12, // begin
      "1021", // cod
      'Cita 21', // title
      DateTime.now().add(Duration(hours: 21)),
      DateTime.now().add(Duration(hours: 12)),
      21, // description
      // end
      21, // pet_id
      "21", // creator_ID
      true, // event_type
      2, // editable // day_id
    ),
    Cita(
      1, // id
      12, // begin
      "1021", // cod
      'Cita 21', // title
      DateTime.now().add(Duration(hours: 21)),
      DateTime.now().add(Duration(hours: 12)),
      21, // description
      // end
      21, // pet_id
      "21", // creator_ID
      true, // event_type
      2, // editable // day_id
    ),
    // add more Cita objects as necessary
  ];
  late Future<ApiResponse> futureResponse;

  @override
  void initState() {
    super.initState();
    futureResponse = fetchFromApi(
        RequestOptions(method: HttpMethods.get, path: '/api/calendar/events'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de eventos'),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.principal);
          },
        ),
        backgroundColor: Color.fromARGB(128, 0, 213, 255),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 500) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 90,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.principal);
                    },
                    label: const Text('Principal'),
                    icon: const Icon(Icons.home),
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.maps);
                    },
                    label: const Text('Ir al mapa'),
                    icon: const Icon(Icons.map_rounded),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                ],
              ),
              FutureBuilder<ApiResponse>(
                future: futureResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final ApiResponse apiResponse = snapshot.data!;
                    if (apiResponse.statusCode == 200) {
                      final List<dynamic> body = jsonDecode(apiResponse.body);
                      citas = body
                          .map((dynamic item) => Cita.fromJson(item))
                          .toList();
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: citas.length,
                          itemBuilder: (context, index) {
                            return CitaCard(cita: citas[index]);
                          },
                        ),
                      );
                    } else {
                      return Text('Error al obtener los datos');
                    }
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              // FutureBuilder<ApiResponse>(
              //   future: futureResponse,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       final ApiResponse apiResponse = snapshot.data!;
              //       if (apiResponse.statusCode == 200) {
              //         final List<dynamic> body = jsonDecode(apiResponse.body);
              //         final List<Cita> citas =
              //             body.map((item) => Cita.fromJson(item)).toList();
              //         print('Cita data: $citas');
              //         print('data: $body');
              //         return Flexible(
              //           child: ListView.builder(
              //             padding: const EdgeInsets.all(8),
              //             itemCount: citas.length,
              //             itemBuilder: (context, index) {
              //               return CitaCard(cita: citas[index]);
              //             },
              //           ),
              //         );
              //       } else {
              //         // handle non-200 status code
              //         return Text('Error: ${apiResponse.statusCode}');
              //       }
              //     } else if (snapshot.hasError) {
              //       // handle error
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       // handle loading state
              //       return CircularProgressIndicator();
              //     }
              //   },
              // )
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.principal);
                    },
                    label: const Text('Principal'),
                    icon: const Icon(Icons.home),
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.maps);
                    },
                    label: const Text('Ir al mapa'),
                    icon: const Icon(Icons.map_rounded),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              FutureBuilder<ApiResponse>(
                future: futureResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final ApiResponse apiResponse = snapshot.data!;
                    if (apiResponse.statusCode == 200) {
                      final Map<String, dynamic> body =
                          jsonDecode(apiResponse.body);
                      final List<dynamic> events = body['events'];
                      citas = events.map((dynamic item) {
                        final Map<String, dynamic> citaMap = item;
                        if (citaMap['creator_ID'] != null) {
                          citaMap['creator_ID'] =
                              int.tryParse(citaMap['creator_ID'].toString()) ??
                                  0;
                        }
                        return Cita.fromJson(citaMap);
                      }).toList();
                      return Flexible(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: citas.length,
                          itemBuilder: (context, index) {
                            return CitaCard(cita: citas[index]);
                          },
                        ),
                      );
                    } else {
                      // handle non-200 status code
                      return Text('Error: ${apiResponse.statusCode}');
                    }
                  } else if (snapshot.hasError) {
                    // handle error
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // handle loading state
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          );
        }
      }),
    );
  }
}
