// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeModelAdapter extends TypeAdapter<HomeModel> {
  @override
  final int typeId = 2;

  @override
  HomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeModel(
      day: fields[0] as int,
      calories: fields[1] as int,
      km: fields[2] as int,
      steps: fields[3] as int,
      activeMinutes: fields[4] as int,
      workouts: (fields[5] as List).cast<Trainings>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomeModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.calories)
      ..writeByte(2)
      ..write(obj.km)
      ..writeByte(3)
      ..write(obj.steps)
      ..writeByte(4)
      ..write(obj.activeMinutes)
      ..writeByte(5)
      ..write(obj.workouts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TrainingsAdapter extends TypeAdapter<Trainings> {
  @override
  final int typeId = 3;

  @override
  Trainings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Trainings(
      calories: fields[1] as int,
      description: fields[0] as String,
      level: fields[2] as String,
      minutes: fields[3] as int,
      title: fields[4] as String,
      image: fields[5] as String,
      isComplete: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Trainings obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.calories)
      ..writeByte(2)
      ..write(obj.level)
      ..writeByte(3)
      ..write(obj.minutes)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
