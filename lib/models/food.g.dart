// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      name: json['name'] as String,
      cost: (json['cost'] as num).toDouble(),
      avatarFood: json['avatarFood'] as String?,
      statusFood: json['statusFood'] as bool?,
      description: json['description'] as String?,
    )..discount = (json['discount'] as num?)?.toDouble();

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'name': instance.name,
      'cost': instance.cost,
      'discount': instance.discount,
      'avatarFood': instance.avatarFood,
      'statusFood': instance.statusFood,
      'description': instance.description,
    };
