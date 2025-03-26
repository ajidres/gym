import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:prove_metro_app/domain/activities_use_case.dart';
import 'package:prove_metro_app/domain/member_use_case.dart';
import 'package:prove_metro_app/domain/trainers_use_case.dart';
import 'package:prove_metro_app/models/activities_model.dart';
import 'package:prove_metro_app/models/members_model.dart';
import 'package:prove_metro_app/models/trainers_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final SaveMemberUseCase _saveMemberUseCase;
  final GetMemberUseCase _getMemberUseCase;

  final SaveActivitiesUseCase _saveActivitiesUseCase;
  final SaveTrainersUseCase _saveTrainersUseCase;

  HomeCubit(
    this._saveMemberUseCase,
    this._getMemberUseCase,
    this._saveActivitiesUseCase,
    this._saveTrainersUseCase,
  ) : super(HomeInitial());

  Future<void> loadJson() async {
    String dataMember = await rootBundle.loadString(
      'assets/jsons/list_members.json',
    );
    var member = MembersModel.fromJson(jsonDecode(dataMember));

    var exist =
        _getMemberUseCase.getMember() == null ;

    if (exist) {
      await _saveMemberUseCase.saveMember(member);
      loadActivities();
      loadTrainers();
    }
  }

  Future<void> loadActivities() async {
    String data = await rootBundle.loadString(
      'assets/jsons/list_activities.json',
    );
    var  activities = jsonDecode(data);

    var list = (activities as List).map((element){

      return ActivitiesModel.fromJson(element);
    }).toList();

    await _saveActivitiesUseCase.saveActivities(list);

  }

  Future<void> loadTrainers() async {
    String data = await rootBundle.loadString(
      'assets/jsons/list_trainers.json',
    );
    var trainers = jsonDecode(data);

    var list = (trainers as List).map((element){

      return TrainersModel.fromJson(element);
    }).toList();

    await _saveTrainersUseCase.saveTrainers(list);

  }
}
