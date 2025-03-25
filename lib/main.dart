import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prove_metro_app/models/activities_model.dart';
import 'package:prove_metro_app/models/members_model.dart';
import 'package:prove_metro_app/models/trainers_model.dart';
import 'package:prove_metro_app/presentation/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app/presentation/home/cubit/home_cubit.dart';
import 'package:prove_metro_app/presentation/home/home_page.dart';
import 'package:prove_metro_app/presentation/trainners/cubit/trainers_cubit.dart';

import 'config/geit_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //INIT HIVE
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(MembersModelAdapter());
  Hive.registerAdapter(TrainersModelAdapter());
  Hive.registerAdapter(ActivitiesModelAdapter());

  //REGISTER INJECTIONS
  await setupInjections();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          lazy: false,
          create: (BuildContext context) => getIt<HomeCubit>()..loadJson(),
        ),
        BlocProvider<ActivitiesCubit>(
          lazy: false,
          create: (BuildContext context) => getIt<ActivitiesCubit>(),
        ),
        BlocProvider<TrainersCubit>(
          lazy: false,
          create: (BuildContext context) => getIt<TrainersCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
        )
      ),
      home: HomePage(),
    );
  }
}
