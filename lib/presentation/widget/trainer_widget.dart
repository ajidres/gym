import 'package:flutter/material.dart';
import 'package:prove_metro_app/models/trainers_model.dart';

class TrainerWidget extends StatelessWidget {
  const TrainerWidget({super.key, required this.data, required this.imagePositionLeft, this.activities=false});

  final TrainersModel data;
  final bool imagePositionLeft;
  final bool activities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.amberAccent,
                    Colors.amber,
                  ],
                )
            ),),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(visible:imagePositionLeft,child: Image.asset(
                    'assets/images/trainers/${data.imagen}',
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.23,
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                data.nombre,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            data.cv,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(visible:!imagePositionLeft,child: Image.asset(
                    'assets/images/trainers/${data.imagen}',
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.23,
                  )),
                ],
              ),
              Visibility(visible: activities,child: Column(children: [
                Container(
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  height: 0.5,
                  color: Colors.amber,
                ),
                GridView.count(
                  childAspectRatio: 4,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(data.activities.length, (indexGrid) {
                    return Text(
                      '${data.activities[indexGrid].nombreActividadColectiva}\n'
                          '${data.activities[indexGrid].diaClase} ${data.activities[indexGrid].horaClase}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }),
                )
              ],))
              ,
            ],
          ),
        ],
      ),
    );
  }
}
