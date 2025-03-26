import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prove_metro_app/domain/activities_use_case.dart';
import 'package:prove_metro_app/domain/member_use_case.dart';
import 'package:prove_metro_app/domain/trainers_use_case.dart';
import 'package:prove_metro_app/models/activities_model.dart';
import 'package:prove_metro_app/models/members_model.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  final GetTrainersUseCase _getTrainersUseCase;
  final GetActivitiesUseCase _getActivitiesUseCase;
  final GetMemberUseCase _getMemberUseCase;
  final SaveMemberUseCase _saveMemberUseCase;
  final SaveActivitiesUseCase _saveActivitiesUseCase;

  MembersModel? dataUser;
  List<ActivitiesModel>? dataActivities;

  ActivitiesCubit(
    this._getTrainersUseCase,
    this._getActivitiesUseCase,
    this._getMemberUseCase,
    this._saveMemberUseCase,
    this._saveActivitiesUseCase,
  ) : super(ActivitiesInitial());

  Future<void> getActivities() async {
    var dataTrainers = _getTrainersUseCase.getTrainers() ?? [];
    dataActivities = _getActivitiesUseCase.getActivities() ?? [];
    dataUser = _getMemberUseCase.getMember();
    for (var element in dataActivities!) {
      element.trainer =
          dataTrainers
              .where(
                (trainer) => trainer.idTrainer == element.entrenadorResponsable,
              )
              .first;
      element.enrolled = dataUser!.actividades.contains(
        element.idActividadColectiva,
      );
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      emit(ActivitiesData(dataActivities!));
    });
  }

  Future<void> updateActivity(ActivitiesModel activity) async {
    if (activity.enrolled) {
      dataUser!.actividades.removeWhere(
        (element) => element == activity.idActividadColectiva,
      );

      activity.sociosInscritos.removeWhere(
        (element) => element == dataUser!.idPersona,
      );
      activity.enrolled = false;
      checkEnrolled(activity);
    } else {
      dataUser!.actividades.add(activity.idActividadColectiva);
      activity.sociosInscritos.add(dataUser!.idPersona);
      activity.enrolled = true;
      checkEnrolled(activity);
    }

    await _saveMemberUseCase.saveMember(dataUser!);
    await _saveActivitiesUseCase.saveActivities(dataActivities!);

    Future.delayed(const Duration(milliseconds: 200), () {
      emit(ActivitiesData(dataActivities!));
    });
  }


  void checkEnrolled(ActivitiesModel data) {
    dataActivities!
        .where(
          (activity) =>
              activity.idActividadColectiva != data.idActividadColectiva &&
              activity.diaClase == data.diaClase &&
              activity.horaClase == data.horaClase,
        )
        .forEach((single) => single.hideEnroll = !single.hideEnroll);
  }
}
