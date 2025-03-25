import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prove_metro_app/config/geit_injector.dart';
import 'package:prove_metro_app/presentation/trainners/cubit/trainers_cubit.dart';
import 'package:prove_metro_app/presentation/widget/trainer_widget.dart';

class TrainersPage extends StatelessWidget {
  const TrainersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TRAINERS'), centerTitle: true),
      body: BlocConsumer<TrainersCubit, TrainersState>(
        listener: (context, state) {},
        buildWhen: (context, state) {
          return state is TrainersData;
        },
        builder: (context, state) {
          if (state is TrainersInitial) {
            getIt<TrainersCubit>().getTrainers();
          }
          if (state is TrainersData) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {

                return TrainerWidget(data: state.data[index], imagePositionLeft: (index%2)==0, activities: true,);

              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
