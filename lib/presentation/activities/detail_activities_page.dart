import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prove_metro_app/models/activities_model.dart';
import 'package:prove_metro_app/presentation/widget/trainer_widget.dart';

import 'cubit/activities_cubit.dart';

class DetailActivitiesPage extends StatelessWidget {
  const DetailActivitiesPage({super.key, required this.data});

  final ActivitiesModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ActivitiesCubit, ActivitiesState>(
        listener: (context, state) {},
        buildWhen: (context, state) {
          return state is ActivitiesData;
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/images/activities/${data.imagen}',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              data.descripcion,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Trainer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      TrainerWidget(
                        data: data.trainer!,
                        imagePositionLeft: false,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              Positioned(
                top: 60,
                left: 14,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.nombreActividadColectiva,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${data.diaClase} ${data.horaClase}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          'Enrolled: ${data.sociosInscritos.length}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                    Visibility(visible: data.hideEnroll,child:SizedBox(
                      width: MediaQuery.of(context).size.width*0.25,
                      child: Text(
                        'You already have an activity at the same time enrolled',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Visibility(
                      visible: !data.hideEnroll,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<ActivitiesCubit>().updateActivity(
                            data,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            data.enrolled ? Colors.red : Colors.amber,
                          ),
                          visualDensity: VisualDensity.compact,
                          minimumSize: WidgetStateProperty.all<Size>(
                            Size(100, 20),
                          ),
                          shape:
                          WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              side: BorderSide(
                                color:
                                data.enrolled
                                    ? Colors.red
                                    : Colors.amber,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          data.enrolled ? 'UNROLL' : 'ENROLL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
