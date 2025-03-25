part of 'activities_cubit.dart';

@immutable
sealed class ActivitiesState {}

final class ActivitiesInitial extends ActivitiesState {}
final class ActivitiesData extends ActivitiesState {
  final List<ActivitiesModel> data;

  ActivitiesData(this.data);
}
