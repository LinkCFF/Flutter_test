// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cita.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cita _$CitaFromJson(Map<String, dynamic> json) => Cita(
      json['_id'] as String,
      json['day'] as String,
      json['status'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$CitaToJson(Cita instance) => <String, dynamic>{
      '_id': instance.id,
      'day': instance.day,
      'status': instance.status,
      'email': instance.email,
    };
