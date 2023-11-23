import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mypetcare/models/cita.dart';
// import 'package:mypetcare/main.dart';

class CitaCard extends StatelessWidget {
  const CitaCard({
    super.key,
    required this.cita,
  });

  final Cita cita;

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.person_4_rounded;

    return Center(child: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Card(
              margin: const EdgeInsets.only(
                  right: 90, left: 90, bottom: 10, top: 10),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                  leading: FaIcon(icon),
                  title: Text(cita.title),
                  subtitle: Text(cita.description),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton.icon(
                      icon: Icon(Icons.delete_forever),
                      label: Text('Borrar cita'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                )
              ]));
        } else {
          return Card(
              margin: const EdgeInsets.only(
                  right: 10, left: 10, bottom: 10, top: 10),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                  leading: FaIcon(icon),
                  title: Text(cita.title),
                  subtitle: Text(cita.description),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton.icon(
                      icon: Icon(Icons.delete_forever),
                      label: Text('Borrar cita'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                )
              ]));
        }
      },
    ));
  }
}
