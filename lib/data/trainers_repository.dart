import 'package:hive/hive.dart';
import 'package:prove_metro_app/models/trainers_model.dart';

abstract class TrainersRepository{
  Future<void> saveTrainers(Map<int,TrainersModel> trainers);
  TrainersModel? getActivityById(int id);
  List<TrainersModel>? getTrainers();
}

class TrainersRepositoryImpl implements TrainersRepository{

  final Box<TrainersModel> _trainersBox;


  TrainersRepositoryImpl(this._trainersBox);

  @override
  TrainersModel? getActivityById(int id) {
    return _trainersBox.get(id);
  }

  @override
  Future<void> saveTrainers(Map<int,TrainersModel> trainers) async {
    await _trainersBox.putAll(trainers);
  }

  @override
  List<TrainersModel>? getTrainers() {
    return _trainersBox.values.toList();
  }

}