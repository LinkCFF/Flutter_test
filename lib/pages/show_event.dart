// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:mypetcare/components/event_card_item.dart';
// import 'package:mypetcare/connections/request_options.dart';
// import 'package:mypetcare/connections/request_to_api.dart';
// import 'package:mypetcare/connections/response_api.dart';
// import 'package:mypetcare/main.dart';
// import 'package:mypetcare/models/cita.dart';

// class ListaCitas extends StatefulWidget {
//   const ListaCitas({Key? key}) : super(key: key);

//   @override
//   ListaCitasState createState() => ListaCitasState();
// }

// class ListaCitasState extends State<ListaCitas> {
//   List<Cita> citas = [];
//   late Future<ApiResponse> futureResponse;

//   @override
//   void initState() {
//     super.initState();
//     futureResponse = fetchFromApi(
//         RequestOptions(method: HttpMethods.get, path: '/api/calendar/events'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Doctores'),
//         leading: Image.asset('lib/assets/mypetcare.png'),
//         backgroundColor: Color.fromARGB(128, 0, 213, 255),
//       ),
//       body: LayoutBuilder(builder: (context, constraints) {
//         if (constraints.maxWidth > 500) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 90,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(context, Routes.principal);
//                     },
//                     label: const Text('Principal'),
//                     icon: const Icon(Icons.home),
//                   ),
//                   Spacer(),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(context, Routes.maps);
//                     },
//                     label: const Text('Ir al mapa'),
//                     icon: const Icon(Icons.map_rounded),
//                   ),
//                   SizedBox(
//                     width: 90,
//                   ),
//                 ],
//               ),
//               FutureBuilder<ApiResponse>(
//                 future: futureResponse,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final ApiResponse apiResponse = snapshot.data!;
//                     if (apiResponse.statusCode == 200) {
//                       final List<dynamic> body = jsonDecode(apiResponse.body);
//                       citas = body
//                           .map((dynamic item) => Cita.fromJson(item))
//                           .toList();
//                       return Expanded(
//                         child: ListView.builder(
//                           padding: const EdgeInsets.all(8),
//                           itemCount: citas.length,
//                           itemBuilder: (context, index) {
//                             return CitaCard(cita: citas[index]);
//                           },
//                         ),
//                       );
//                     } else {
//                       return Text('Error al obtener los datos');
//                     }
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               ),
//             ],
//           );
//         } else {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(context, Routes.principal);
//                     },
//                     label: const Text('Principal'),
//                     icon: const Icon(Icons.home),
//                   ),
//                   Spacer(),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(context, Routes.maps);
//                     },
//                     label: const Text('Ir al mapa'),
//                     icon: const Icon(Icons.map_rounded),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                 ],
//               ),
//               FutureBuilder<ApiResponse>(
//                 future: futureResponse,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final ApiResponse apiResponse = snapshot.data!;
//                     if (apiResponse.statusCode == 200) {
//                       final List<dynamic> body = jsonDecode(apiResponse.body);
//                       citas = body
//                           .map((dynamic item) => Cita.fromJson(item))
//                           .toList();
//                       return Expanded(
//                         child: ListView.builder(
//                           padding: const EdgeInsets.all(8),
//                           itemCount: citas.length,
//                           itemBuilder: (context, index) {
//                             return CitaCard(cita: citas[index]);
//                           },
//                         ),
//                       );
//                     } else {
//                       return Text('Error al obtener los datos');
//                     }
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               ),
//             ],
//           );
//         }
//       }),
//     );
//   }
// }
