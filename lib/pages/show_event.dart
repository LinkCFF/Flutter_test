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

        List<Cita> citas = [
          Cita(1, 123, "Title 1", "Description 1", DateTime.now(), DateTime.now(), 1, 1,true, "Event type 1"),
          Cita(2, 456, "Title 2", "Description 2", DateTime.now(), DateTime.now(), 2, 2,false, "Event type 2"),
        ];
        return ListView.builder(
            itemCount: citas.length,
            itemBuilder: (context, index) {
              Cita c = citas[index];
              return ListTile(
                leading: Text(c.id.toString()),
                title: Text(c.begin.toString()),
                trailing: c.editable == true
                    ? null
                    : IconButton(icon: Icon(Icons.close), onPressed: () => {}),
              );
            });
      }, future: null,
    );
  }
}
