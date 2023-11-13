import 'package:flutter/material.dart';
import 'package:mypetcare/models/cita.dart';

class ListaCitas extends StatefulWidget {
  const ListaCitas({Key? key}) : super(key: key);

  @override
  ListaCitasState createState() => ListaCitasState();
}

class ListaCitasState extends State<ListaCitas> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // ignore: avoid_unnecessary_containers
          return Container(child: Text("No hay eventos este día"));
        }

        List<Cita> citas = [];
        return ListView.builder(
            itemCount: citas.length,
            itemBuilder: (context, index) {
              Cita c = citas[index];
              return ListTile(
                leading: Text(c.id.toString()),
                title: Text(c.day.toString()),
                trailing: c.status == 'cancelled'
                    ? null
                    : IconButton(icon: Icon(Icons.close), onPressed: () => {}),
              );
            });
      }, future: null,
    );
  }
}
