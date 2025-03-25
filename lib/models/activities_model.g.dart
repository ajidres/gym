// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivitiesModelAdapter extends TypeAdapter<ActivitiesModel> {
  @override
  final int typeId = 0;

  @override
  ActivitiesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivitiesModel(
      idActividadColectiva: fields[0] as int,
      nombreActividadColectiva: fields[1] as String,
      descripcion: fields[2] as String,
      imagen: fields[3] as String,
      entrenadorResponsable: fields[4] as int,
      sociosInscritos: (fields[5] as List).cast<int>(),
      diaClase: fields[6] as String,
      horaClase: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ActivitiesModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.idActividadColectiva)
      ..writeByte(1)
      ..write(obj.nombreActividadColectiva)
      ..writeByte(2)
      ..write(obj.descripcion)
      ..writeByte(3)
      ..write(obj.imagen)
      ..writeByte(4)
      ..write(obj.entrenadorResponsable)
      ..writeByte(5)
      ..write(obj.sociosInscritos)
      ..writeByte(6)
      ..write(obj.diaClase)
      ..writeByte(7)
      ..write(obj.horaClase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivitiesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
