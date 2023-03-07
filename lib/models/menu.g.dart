// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      nameMenu: json['nameMenu'] as String,
      foods: (json['foods'] as List<dynamic>)
          .map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'nameMenu': instance.nameMenu,
      'foods': instance.foods,
      'isActive': instance.isActive,
    };
