// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      idRestaurant: json['idRestaurant'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      avatar: json['avatar'] as String?,
      thumbnails: (json['thumbnails'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: json['category'] as String,
      hashTags: (json['hashTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      likeCount: (json['likeCount'] as num?)?.toDouble(),
      isOpen: json['isOpen'] as bool?,
      isFavorite: json['isFavorite'] as bool?,
      isVerified: json['isVerified'] as bool?,
      calendars: (json['calendars'] as List<dynamic>?)
          ?.map((e) => Calendar.fromJson(e as Map<String, dynamic>))
          .toList(),
      menuOrders: (json['menuOrders'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'idRestaurant': instance.idRestaurant,
      'name': instance.name,
      'description': instance.description,
      'avatar': instance.avatar,
      'thumbnails': instance.thumbnails,
      'category': instance.category,
      'hashTags': instance.hashTags,
      'likeCount': instance.likeCount,
      'isOpen': instance.isOpen,
      'isFavorite': instance.isFavorite,
      'isVerified': instance.isVerified,
      'calendars': instance.calendars,
      'menuOrders': instance.menuOrders,
    };
