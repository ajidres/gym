import 'package:hive/hive.dart';

import 'activities_model.dart';

part 'trainers_model.g.dart';

@HiveType(typeId: 2)
class TrainersModel {
  @HiveField(0)
  final int idTrainer;
  @HiveField(1)
  final String nombre;
  @HiveField(2)
  final String apellidos;
  @HiveField(3)
  final String dni;
  @HiveField(4)
  final String cv;
  @HiveField(5)
  final List<int> actividades;
  @HiveField(6)
  final String imagen;

  List<ActivitiesModel> activities = [];

  TrainersModel({
    required this.idTrainer,
    required this.nombre,
    required this.apellidos,
    required this.dni,
    required this.cv,
    required this.actividades,
    required this.imagen,
  });

  static TrainersModel fromJson(Map<String, dynamic> json) => TrainersModel(
    idTrainer: json['idTrainer'],
    nombre: json['nombre'],
    apellidos: json['apellidos'],
    dni: json['DNI'],
    cv: json['cv'],
    actividades:
        json['actividades'] != null ? json['actividades'].cast<int>() : [],
    imagen: json['imagen'],
  );
}
