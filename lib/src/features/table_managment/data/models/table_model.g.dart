// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableModel _$TableModelFromJson(Map<String, dynamic> json) => TableModel(
      json['hasOrder'] as bool?,
      json['id'] as int,
      json['idF'] as String?,
      json['x'] as num?,
      json['y'] as num?,
    );

Map<String, dynamic> _$TableModelToJson(TableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idF': instance.idF,
      'x': instance.x,
      'y': instance.y,
      'hasOrder': instance.hasOrder,
    };
