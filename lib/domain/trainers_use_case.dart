import 'package:prove_metro_app/data/trainers_repository.dart';
import 'package:prove_metro_app/models/trainers_model.dart';

class SaveTrainersUseCase{

  final TrainersRepository _trainersRepository;

  SaveTrainersUseCase(this._trainersRepository);

  Future<void> saveTrainers(List<TrainersModel> trainers) async {

    Map<int,TrainersModel> mapTrainers = {for (var item in trainers) item.idTrainer : item};

    await _trainersRepository.saveTrainers(mapTrainers);
  }

}


class GetTrainersUseCase{

  final TrainersRepository _trainersRepository;

  GetTrainersUseCase(this._trainersRepository);

  List<TrainersModel>? getTrainers() {
    return _trainersRepository.getTrainers();
  }

  TrainersModel? getTrainersById(int id) {
    return _trainersRepository.getActivityById(id);
  }
}