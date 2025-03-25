// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainers_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainersModelAdapter extends TypeAdapter<TrainersModel> {
  @override
  final int typeId = 2;

  @override
  TrainersModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainersModel(
      idTrainer: fields[0] as int,
      nombre: fields[1] as String,
      apellidos: fields[2] as String,
      dni: fields[3] as String,
      cv: fields[4] as String,
      actividades: (fields[5] as List).cast<int>(),
      imagen: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrainersModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.idTrainer)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.apellidos)
      ..writeByte(3)
      ..write(obj.dni)
      ..writeByte(4)
      ..write(obj.cv)
      ..writeByte(5)
      ..write(obj.actividades)
      ..writeByte(6)
      ..write(obj.imagen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainersModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
