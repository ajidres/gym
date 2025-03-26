import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prove_metro_app/config/geit_injector.dart';
import 'package:prove_metro_app/presentation/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app/presentation/activities/detail_activities_page.dart';
import 'package:prove_metro_app/presentation/widget/activities_widget.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {

  @override
  void initState() {
    getIt<ActivitiesCubit>().getActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ACTIVITIES'), centerTitle: true),
      body: BlocConsumer<ActivitiesCubit, ActivitiesState>(
        listener: (context, state) {},
        buildWhen: (context, state) {
          return state is ActivitiesData;
        },
        builder: (context, state) {
          if (state is ActivitiesData) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder:
                            (_) =>
                                DetailActivitiesPage(data: state.data[index]),
                      ),
                    );
                  },
                  child: ActivitiesWidget(data: state.data[index],onDetail: (){
                    context.read<ActivitiesCubit>().updateUser(
                      state.data[index],
                    );
                  },),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
