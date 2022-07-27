import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math_64.dart';

part 'table_model.g.dart';

@JsonSerializable()
class TableModel extends Equatable {
  final int id;
  String? idF;
  num? x;
  num? y;
  bool isEdit;
  bool? hasOrder;
  String shape;

  @JsonKey(ignore: true)
  Vector3? vector;
  TableModel(
      {this.hasOrder,
      required this.id,
      this.idF,
      this.x,
      this.y,
      this.isEdit = false,
      this.shape = 'r'});

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
  Map<String, dynamic> toJson() => _$TableModelToJson(this);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
