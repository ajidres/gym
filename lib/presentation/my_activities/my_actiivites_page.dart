import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prove_metro_app/config/geit_injector.dart';
import 'package:prove_metro_app/presentation/activities/cubit/activities_cubit.dart';
import 'package:prove_metro_app/presentation/activities/detail_activities_page.dart';
import 'package:prove_metro_app/presentation/widget/activities_widget.dart';

class MyActivitiesPage extends StatelessWidget {
  const MyActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MY ACTIVITIES'), centerTitle: true),
      body: BlocConsumer<ActivitiesCubit, ActivitiesState>(
        listener: (context, state) {},
        buildWhen: (context, state) {
          return state is ActivitiesData;
        },
        builder: (context, state) {
          if (state is ActivitiesInitial) {
            getIt<ActivitiesCubit>().getActivities();
          }
          if (state is ActivitiesData) {

            var dataUser = state.data.where((element)=>element.enrolled).toList();

            if(dataUser.isEmpty){
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Image.asset(
                      'assets/images/actions/pesas.png',

                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'No enrolled activities',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],),
              );
            }

            return ListView.builder(
              itemCount: dataUser.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder:
                            (_) =>
                            DetailActivitiesPage(data: dataUser[index]),
                      ),
                    );
                  },
                  child: ActivitiesWidget(data: dataUser[index],
                    showTrainer: true,
                    onDetail: (){
                    context.read<ActivitiesCubit>().updateActivity(
                      dataUser[index],
                    );
                  },)

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
