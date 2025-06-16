import 'package:hive/hive.dart';

part 'recipeModel.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject{
  @HiveField(0)
  String recipeName;

  @HiveField(1)
  String ingredients;

  @HiveField(2)
  String instructions;

  @HiveField(3)
  String category;

  @HiveField(4)
  bool isFavorite;

  Recipe({

    required this.recipeName,
    required this.ingredients,
    required this.instructions,
    required this.category,
    this.isFavorite = false,

});

}
