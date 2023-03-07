import 'package:json_annotation/json_annotation.dart';
import 'food.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  String nameMenu;
  List<Food> foods;
  bool? isActive;

  Menu({
    required this.nameMenu,
    required this.foods,
    this.isActive = true,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}