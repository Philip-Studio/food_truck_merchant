import 'package:json_annotation/json_annotation.dart';

//import 'calendar.dart';
import 'calendar.dart';
import 'menu.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  String idRestaurant;
  String name;
  String description;
  String? avatar;
  List<String>? thumbnails;
  String category;
  List<String>? hashTags;
  double? likeCount;
  bool? isOpen;
  bool? isFavorite;
  bool? isVerified;
  List<Calendar>? calendars;
  List<Menu> menuOrders;

  Restaurant({
    required this.idRestaurant,
    required this.name,
    required this.description,
    this.avatar,
    this.thumbnails,
    required this.category,
    this.hashTags,
    this.likeCount,
    this.isOpen,
    this.isFavorite,
    this.isVerified,
    this.calendars,
    required this.menuOrders,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}