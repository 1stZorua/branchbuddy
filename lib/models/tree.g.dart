// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TreeAdapter extends TypeAdapter<Tree> {
  @override
  final int typeId = 0;

  @override
  Tree read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tree(
      species: fields[0] as String,
      plantingDate: fields[1] as DateTime,
      location: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Tree obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.species)
      ..writeByte(1)
      ..write(obj.plantingDate)
      ..writeByte(2)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TreeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
