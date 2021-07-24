// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app-search-game-model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameDetailsAdapter extends TypeAdapter<GameDetails> {
  @override
  final int typeId = 0;

  @override
  GameDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameDetails(
      name: fields[0] as String,
      released: fields[1] as String,
      image: fields[2] as String,
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GameDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.released)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
