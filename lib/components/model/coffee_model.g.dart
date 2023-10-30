// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoffeeModelAdapter extends TypeAdapter<CoffeeModel> {
  @override
  final int typeId = 1;

  @override
  CoffeeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoffeeModel(
      name: fields[0] as String,
      price: fields[1] as String,
      category: fields[2] as String,
      imagePath: fields[3] as String?,
      quantity: fields[4] as String,
      id: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CoffeeModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoffeeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
