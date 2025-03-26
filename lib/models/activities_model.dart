import 'package:hive/hive.dart';
import 'package:prove_metro_app/models/trainers_model.dart';

part 'activities_model.g.dart';

@HiveType(typeId: 0)
class ActivitiesModel {
  @HiveField(0)
  final int idActividadColectiva;
  @HiveField(1)
  final String nombreActividadColectiva;
  @HiveField(2)
  final String descripcion;
  @HiveField(3)
  final String imagen;
  @HiveField(4)
  final int entrenadorResponsable;
  @HiveField(5)
  final List<int> sociosInscritos;
  @HiveField(6)
  final String diaClase;
  @HiveField(7)
  final String horaClase;
  @HiveField(8)
  bool enrolled;
  @HiveField(9)
  bool hideEnroll;

  TrainersModel? trainer;

  ActivitiesModel( {
    required this.idActividadColectiva,
    required this.nombreActividadColectiva,
    required this.descripcion,
    required this.imagen,
    required this.entrenadorResponsable,
    required this.sociosInscritos,
    required this.diaClase,
    required this.horaClase,
    required this.enrolled,
    required this.hideEnroll,
  });

  static ActivitiesModel fromJson(Map<String, dynamic> json) => ActivitiesModel(
    idActividadColectiva: json['idActividadColectiva'],
    nombreActividadColectiva: json['nombreActividadColectiva'],
    descripcion: json['descripcion'],
    imagen: json['imagen'],
    entrenadorResponsable: json['entrenadorResponsable'],
    sociosInscritos:
        json['sociosInscritos'] != null
            ? json['sociosInscritos'].cast<int>()
            : [],
    diaClase: json['diaClase'],
    horaClase: json['horaClase'],
      enrolled: false,
      hideEnroll: false
  );
}
