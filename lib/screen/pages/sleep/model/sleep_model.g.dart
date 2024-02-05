// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelXManAdapter extends TypeAdapter<ModelXMan> {
  @override
  final int typeId = 5;

  @override
  ModelXMan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelXMan(
      startDate: fields[0] as DateTime,
      endDate: fields[1] as DateTime,
      date: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ModelXMan obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.startDate)
      ..writeByte(1)
      ..write(obj.endDate)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelXManAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
