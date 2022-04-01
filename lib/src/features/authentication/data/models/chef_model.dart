import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chef_model.g.dart';

@JsonSerializable()
class ChefModel extends Equatable {
  final int? branchId;
  const ChefModel(this.branchId);

  factory ChefModel.fromJson(Map<String, dynamic> json) =>
      _$ChefModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChefModelToJson(this);
  @override
  List<Object?> get props => [branchId];
}
