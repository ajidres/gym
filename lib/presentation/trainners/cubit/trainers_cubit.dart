import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prove_metro_app/domain/activities_use_case.dart';
import 'package:prove_metro_app/domain/trainers_use_case.dart';
import 'package:prove_metro_app/models/trainers_model.dart' show TrainersModel;

part 'trainers_state.dart';

class TrainersCubit extends Cubit<TrainersState> {

  final GetTrainersUseCase _getTrainersUseCase;
  final GetActivitiesUseCase _getActivitiesUseCase;

  TrainersCubit(this._getTrainersUseCase, this._getActivitiesUseCase) : super(TrainersInitial());

  Future<void> getTrainers() async {
    var dataTrainers = _getTrainersUseCase.getTrainers()??[];
    var data = _getActivitiesUseCase.getActivities()??[];
    for (var element in dataTrainers) {
      element.activities = data.where((activities) => activities.entrenadorResponsable==element.idTrainer).toList();
    }
    Future.delayed(const Duration(milliseconds: 200), () {
      emit(TrainersData(dataTrainers));
    });

  }


}
