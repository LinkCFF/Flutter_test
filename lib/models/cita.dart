// ignore_for_file: non_constant_identifier_names

//import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'cita.g.dart';

@JsonSerializable()
class Cita {

=======
  Cita(
    this.id,
    this.cod,
    this.title,
    this.description,
    this.begin,
    this.end,
    this.pet_id,
    this.creator_ID,
    this.event_type,
    this.editable,
    this.day_id,
  );
  @JsonKey(name: '_id')
  final int id;
  final DateTime begin;
  int cod;
  String title;
  String description;
  DateTime end;
  int pet_id;
  int creator_ID;
  String event_type;
  bool editable;
  int day_id;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Cita.fromJson(Map<String, dynamic> json) => _$CitaFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CitaToJson(this);
  @override
  String toString() {
    return 'Cita{_id: $id, cod: $cod, title: $title, description: $description, begin:$begin, end:$end,pet_id:$pet_id,creator_ID:$creator_ID,event_type:$event_type,editable:$editable,day_id:$day_id}';
  }
}
