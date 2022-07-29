import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meseros_app/src/features/authentication/data/models/chef_model.dart';
import 'package:meseros_app/src/features/authentication/data/models/waiter_model.dart';
part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends Equatable {
  int id;
  String name;
  String lastName;
  String email;
  String rol;
  bool isAdmin;
  bool? isWaiter;
  int? branchId;
  @JsonKey(name: "access_token")
  final String? accessToken;
  WaiterModel? waiter;
  ChefModel? chef;
  UserModel(this.id, this.name, this.lastName, this.email, this.isAdmin,
      this.accessToken, this.rol, this.waiter, this.chef, this.branchId);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  @override
  List<Object?> get props =>
      [name, lastName, email, rol, accessToken, isAdmin, chef, waiter];
}
