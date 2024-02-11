// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prem_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JHgjkJHdAdapter extends TypeAdapter<JHgjkJHd> {
  @override
  final int typeId = 11;

  @override
  JHgjkJHd read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JHgjkJHd(
      secondUrl: fields[0] as String,
      isOpen: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, JHgjkJHd obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.secondUrl)
      ..writeByte(1)
      ..write(obj.isOpen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JHgjkJHdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
