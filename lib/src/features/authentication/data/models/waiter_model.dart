import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'waiter_model.g.dart';

@JsonSerializable()
class WaiterModel extends Equatable {
  final int? branchId;
  const WaiterModel(this.branchId);

  factory WaiterModel.fromJson(Map<String, dynamic> json) =>
      _$WaiterModelFromJson(json);

  Map<String, dynamic> toJson() => _$WaiterModelToJson(this);
  @override
  List<Object?> get props => [branchId];
}
