part of 'trainers_cubit.dart';

@immutable
sealed class TrainersState {}

final class TrainersInitial extends TrainersState {}

final class TrainersData extends TrainersState {
  final List<TrainersModel> data;

  TrainersData(this.data);
}
