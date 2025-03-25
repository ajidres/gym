import 'package:hive/hive.dart';

part 'members_model.g.dart';

@HiveType(typeId: 1)
class MembersModel {
  @HiveField(0)
  final int idPersona;
  @HiveField(1)
  final String nombre;
  @HiveField(2)
  final String apellidos;
  @HiveField(3)
  final String dni;
  @HiveField(4)
  final List<int> actividades;

  MembersModel({
    required this.idPersona,
    required this.nombre,
    required this.apellidos,
    required this.dni,
    this.actividades=const []
  });

  static MembersModel fromJson(Map<String, dynamic> json) => MembersModel(
    idPersona: json['idPersona'] ?? 0,
    nombre: json['nombre'] ?? '',
    apellidos: json['apellidos'] ?? '',
    dni: json['DNI'] ?? ''
  );
}
