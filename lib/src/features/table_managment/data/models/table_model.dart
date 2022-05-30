import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'table_model.g.dart';

@JsonSerializable()
class TableModel extends Equatable {
  final int id;
  String? idF;
  num? x;
  num? y;
  bool? hasOrder;

  TableModel(this.hasOrder, this.id, this.idF, this.x, this.y);

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
  Map<String, dynamic> toJson() => _$TableModelToJson(this);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
