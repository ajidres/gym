// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'members_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MembersModelAdapter extends TypeAdapter<MembersModel> {
  @override
  final int typeId = 1;

  @override
  MembersModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MembersModel(
      idPersona: fields[0] as int,
      nombre: fields[1] as String,
      apellidos: fields[2] as String,
      dni: fields[3] as String,
      actividades: (fields[4] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, MembersModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.idPersona)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.apellidos)
      ..writeByte(3)
      ..write(obj.dni)
      ..writeByte(4)
      ..write(obj.actividades);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MembersModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
