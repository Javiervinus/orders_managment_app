// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableModel _$TableModelFromJson(Map<String, dynamic> json) => TableModel(
      hasOrder: json['hasOrder'] as bool? ?? false,
      id: json['id'] as int?,
      idF: json['idF'] as String?,
      x: json['x'] as num?,
      y: json['y'] as num?,
      name: json['name'] as String? ?? "",
      shape: json['shape'] as String? ?? 'r',
    );

Map<String, dynamic> _$TableModelToJson(TableModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('idF', instance.idF);
  val['x'] = instance.x;
  val['y'] = instance.y;
  val['hasOrder'] = instance.hasOrder;
  val['shape'] = instance.shape;
  val['name'] = instance.name;
  return val;
}
