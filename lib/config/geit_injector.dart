import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:prove_metro_app/data/activities_repository.dart';
import 'package:prove_metro_app/data/member_repository.dart';
import 'package:prove_metro_app/data/trainers_repository.dart';
import 'package:prove_metro_app/domain/activities_use_case.dart';
import 'package:prove_metro_app/domain/member_use_case.dart'
    show GetMemberUseCase, SaveMemberUseCase;
import 'package:prove_metro_app/domain/trainers_use_case.dart';
import 'package:prove_metro_app/models/activities_model.dart';
import 'package:prove_metro_app/models/members_model.dart';
import 'package:prove_metro_app/models/trainers_model.dart';
import 'package:prove_metro_app/presentation/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app/presentation/home/cubit/home_cubit.dart';
import 'package:prove_metro_app/presentation/trainners/cubit/trainers_cubit.dart';

import 'constants.dart';

final getIt = GetIt.asNewInstance();

Future<void> setupInjections() async {
  final membersBox = await Hive.openBox<MembersModel>(BOX_MEMBERS);
  final activitiesBox = await Hive.openBox<ActivitiesModel>(BOX_ACTIVITIES);
  final trainersBox = await Hive.openBox<TrainersModel>(BOX_TRAINERS);

  getIt
    //BOX
    ..registerLazySingleton<Box<ActivitiesModel>>(() => activitiesBox)
    ..registerLazySingleton<Box<TrainersModel>>(() => trainersBox)
    ..registerLazySingleton<Box<MembersModel>>(() => membersBox)
    //REPOSITORIES
    ..registerLazySingleton<MemberRepository>(
      () => MemberRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<ActivitiesRepository>(
      () => ActivitiesRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<TrainersRepository>(
      () => TrainersRepositoryImpl(getIt()),
    )
    //USE CASES
    ..registerLazySingleton<SaveMemberUseCase>(() => SaveMemberUseCase(getIt()))
    ..registerLazySingleton<GetMemberUseCase>(() => GetMemberUseCase(getIt()))
    ..registerLazySingleton<SaveActivitiesUseCase>(
      () => SaveActivitiesUseCase(getIt()),
    )
    ..registerLazySingleton<GetActivitiesUseCase>(
      () => GetActivitiesUseCase(getIt()),
    )
    ..registerLazySingleton<SaveTrainersUseCase>(
      () => SaveTrainersUseCase(getIt()),
    )
    ..registerLazySingleton<GetTrainersUseCase>(
      () => GetTrainersUseCase(getIt()),
    )
    //CUBITS
    ..registerLazySingleton<HomeCubit>(
      () => HomeCubit(getIt(), getIt(), getIt(), getIt()),
    )
    ..registerLazySingleton<TrainersCubit>(
          () => TrainersCubit(getIt(), getIt()),
    )
    ..registerLazySingleton<ActivitiesCubit>(
          () => ActivitiesCubit(getIt(),getIt(),getIt(), getIt(), getIt()),
    )
  ;
}
