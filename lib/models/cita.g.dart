// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cita _$CitaFromJson(Map<String, dynamic> json) => Cita(
      json['_id'] as int,
      json['cod'] as int,
      json['title'] as String,
      json['description'] as String,
      DateTime.parse(json['begin'] as String),
      DateTime.parse(json['end'] as String),
      json['pet_id'] as int,
      json['creator_ID'] as int,
      json['event_type'] as String,
      json['editable'] as bool,
    );

Map<String, dynamic> _$CitaToJson(Cita instance) => <String, dynamic>{
      '_id': instance.id,
      'begin': instance.begin.toIso8601String(),
      'cod': instance.cod,
      'title': instance.title,
      'description': instance.description,
      'end': instance.end.toIso8601String(),
      'pet_id': instance.pet_id,
      'creator_ID': instance.creator_ID,
      'event_type': instance.event_type,
      'editable': instance.editable,
    };
