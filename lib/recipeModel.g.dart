// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipeModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      recipeName: fields[0] as String,
      ingredients: fields[1] as String,
      instructions: fields[2] as String,
      category: fields[3] as String,
      isFavorite: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.recipeName)
      ..writeByte(1)
      ..write(obj.ingredients)
      ..writeByte(2)
      ..write(obj.instructions)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
