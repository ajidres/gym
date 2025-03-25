import 'package:flutter/material.dart';
import 'package:prove_metro_app/models/activities_model.dart';

class ActivitiesWidget extends StatelessWidget {
  const ActivitiesWidget({super.key, required this.data, required this.onDetail, this.showTrainer=false});

  final ActivitiesModel data;
  final VoidCallback onDetail;
  final bool showTrainer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              'assets/images/activities/${data.imagen}',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * (showTrainer?0.13:0.08),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(visible: showTrainer,
                    child: Row(children: [
                      Image.asset(
                        'assets/images/trainers/${data.trainer!.imagen}',

                        height: MediaQuery.of(context).size.height * 0.13,
                        fit: BoxFit.fill,
                      ),

                    ],)),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data
                            .nombreActividadColectiva,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        '${data.diaClase} ${data.horaClase}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: onDetail,
                  style: ButtonStyle(
                    backgroundColor:
                    WidgetStateProperty.all<Color>(
                      data.enrolled
                          ? Colors.red
                          : Colors.amber,
                    ),
                    visualDensity: VisualDensity.compact,
                    minimumSize: WidgetStateProperty.all<Size>(
                      Size(
                        MediaQuery.of(context).size.width * 0.01,
                        MediaQuery.of(context).size.height * 0.01,
                      ),
                    ),
                    shape: WidgetStateProperty.all<
                        RoundedRectangleBorder
                    >(
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
                    data.enrolled
                        ? 'UNROLL'
                        : 'ENROLL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
