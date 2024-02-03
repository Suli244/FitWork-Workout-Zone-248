// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kcal_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KCalHiveModelAdapter extends TypeAdapter<KCalHiveModel> {
  @override
  final int typeId = 1;

  @override
  KCalHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KCalHiveModel(
      calory: fields[0] as int,
      date: fields[1] as String,
      type: fields[2] as String,
      carbs: fields[3] as int,
      protein: fields[4] as int,
      fats: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, KCalHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.calory)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.carbs)
      ..writeByte(4)
      ..write(obj.protein)
      ..writeByte(5)
      ..write(obj.fats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KCalHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
