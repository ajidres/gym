import 'package:hive/hive.dart';
import 'package:prove_metro_app/models/activities_model.dart';

abstract class ActivitiesRepository{
  Future<void> saveActivities(Map<int,ActivitiesModel> activities);
  ActivitiesModel? getActivityById(int id);
  List<ActivitiesModel>? getActivities();
}

class ActivitiesRepositoryImpl implements ActivitiesRepository{

  final Box<ActivitiesModel> _activitiesBox;


  ActivitiesRepositoryImpl(this._activitiesBox);

  @override
  ActivitiesModel? getActivityById(int id) {
    return _activitiesBox.get(id);
  }

  @override
  Future<void> saveActivities(Map<int,ActivitiesModel> activities) async {
    await _activitiesBox.putAll(activities);
  }

  @override
  List<ActivitiesModel>? getActivities() {
    return _activitiesBox.values.toList();
  }

}