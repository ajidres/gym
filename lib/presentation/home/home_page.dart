import 'package:flutter/material.dart';
import 'package:prove_metro_app/presentation/activities/activities_page.dart';
import 'package:prove_metro_app/presentation/my_activities/my_actiivites_page.dart';
import 'package:prove_metro_app/presentation/trainners/trainners_page.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var indexBottomNavbar = 0;
  final bodies = [
    const MyActivitiesPage(),
    const ActivitiesPage(),
    const TrainersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        onTap: (value) {
          setState(() {
            indexBottomNavbar=value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/actions/my_activities.png')), label: 'My Activities'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/actions/activities.png')), label: 'Activities'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/actions/trainers.png')), label: 'Trainners'),
        ],
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}
