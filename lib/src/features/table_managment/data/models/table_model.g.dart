// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableModel _$TableModelFromJson(Map<String, dynamic> json) => TableModel(
      hasOrder: json['hasOrder'] as bool?,
      id: json['id'] as int,
      idF: json['idF'] as String?,
      x: json['x'] as num?,
      y: json['y'] as num?,
      isEdit: json['isEdit'] as bool? ?? false,
      shape: json['shape'] as String? ?? 'r',
    );

Map<String, dynamic> _$TableModelToJson(TableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idF': instance.idF,
      'x': instance.x,
      'y': instance.y,
      'isEdit': instance.isEdit,
      'hasOrder': instance.hasOrder,
      'shape': instance.shape,
    };
