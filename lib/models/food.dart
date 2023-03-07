import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  String name;
  double cost;
  double? discount;
  String? avatarFood;
  bool? statusFood;
  String? description;

  Food({
    required this.name,
    required this.cost,
    this.avatarFood,
    this.statusFood,
    this.description,
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);

  double price() {
    if(discount == null || discount == 1.0) {
      return cost;
    }
    return cost * discount!;
  }
}