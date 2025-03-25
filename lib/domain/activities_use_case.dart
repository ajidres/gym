
import 'package:prove_metro_app/data/activities_repository.dart';
import 'package:prove_metro_app/models/activities_model.dart';

class SaveActivitiesUseCase{

  final ActivitiesRepository _activitiesRepository;

  SaveActivitiesUseCase(this._activitiesRepository);

  Future<void> saveActivities(List<ActivitiesModel> activities) async {

    Map<int,ActivitiesModel> mapActivities = {for (var item in activities) item.idActividadColectiva : item};

    await _activitiesRepository.saveActivities(mapActivities);
  }

}


class GetActivitiesUseCase{

  final ActivitiesRepository _activitiesRepository;

  GetActivitiesUseCase(this._activitiesRepository);

  List<ActivitiesModel>? getActivities() {
    return _activitiesRepository.getActivities();
  }

  ActivitiesModel? getActivitiesById(int id) {
    return _activitiesRepository.getActivityById(id);
  }
}