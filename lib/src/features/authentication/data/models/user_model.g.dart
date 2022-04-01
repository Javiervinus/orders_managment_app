// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['name'] as String,
      json['lastName'] as String,
      json['email'] as String,
      json['isAdmin'] as bool,
      json['access_token'] as String?,
      json['rol'] as String,
      json['waiter'] == null
          ? null
          : WaiterModel.fromJson(json['waiter'] as Map<String, dynamic>),
      json['chef'] == null
          ? null
          : ChefModel.fromJson(json['chef'] as Map<String, dynamic>),
    )..isWaiter = json['isWaiter'] as bool?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'rol': instance.rol,
      'isAdmin': instance.isAdmin,
      'isWaiter': instance.isWaiter,
      'access_token': instance.accessToken,
      'waiter': instance.waiter,
      'chef': instance.chef,
    };
