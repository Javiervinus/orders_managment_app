import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math_64.dart';

part 'table_model.g.dart';

@JsonSerializable()
class TableModel extends Equatable {
  @JsonKey(includeIfNull: false)
  int? id;
  @JsonKey(includeIfNull: false)
  String? idF;
  num? x;
  num? y;
  @JsonKey(ignore: true)
  bool isEdit;
  bool hasOrder;
  String shape;
  String name;

  @JsonKey(ignore: true)
  Vector3? vector;
  TableModel(
      {this.hasOrder = false,
      this.id,
      this.idF,
      this.x,
      this.y,
      this.isEdit = false,
      this.name = "",
      this.shape = 'r'});

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
  Map<String, dynamic> toJson() => _$TableModelToJson(this);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
