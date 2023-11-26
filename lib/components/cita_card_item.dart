import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mypetcare/models/cita.dart';

class CitaCard extends StatelessWidget {
  const CitaCard({
    super.key,
    required this.cita,
  });

  final Cita cita;

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.calendar_month;
    switch (cita.editable) {
      case true:
        icon = Icons.calendar_today;
        break;
      /*
      case "cat":
        icon = FontAwesomeIcons.cat;
        break;
      case "bird":
        icon = FontAwesomeIcons.dove;
        break;
      case "fish":
        icon = FontAwesomeIcons.fish;
        break;
      case "reptile":
        icon = FontAwesomeIcons.dragon;
        break;
      case "horse":
        icon = FontAwesomeIcons.horse;
        break;
      */
      default:
        icon = Icons.calendar_month;
        break;
    }

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
                  subtitle: Text('Cliente: ${cita.client_ID} , Editable: ${cita.editable} ',maxLines: 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton.icon(
                      icon: Icon(Icons.edit),
                      label: Text('Editar'),
                      onPressed: () {/* ... */},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      icon: Icon(Icons.delete),
                      label: Text('Eliminar'),
                      onPressed: () {/* ... */},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.admin_panel_settings),
                      label: Text('Administrar'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const SizedBox(width: 3),
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
                  subtitle: Text('cliente: ${cita.client_ID} , editable: ${cita.editable} ',maxLines: 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton.icon(
                      icon: Icon(Icons.edit),
                      label: Text(''),
                      onPressed: () {/* ... */},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      icon: Icon(Icons.delete),
                      label: Text(''),
                      onPressed: () {/* ... */},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.admin_panel_settings),
                      label: Text(''),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const SizedBox(width: 3),
                  ],
                )
              ]));
        }
      },
    ));
  }
}
