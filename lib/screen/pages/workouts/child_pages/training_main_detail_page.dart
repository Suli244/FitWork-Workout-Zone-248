import 'package:flutter/material.dart';
import 'package:workout_zone_248/screen/pages/workouts/child_pages/workout_detail_page.dart';
import 'package:workout_zone_248/screen/pages/workouts/state/models/workouts_model.dart';

class TrainingMainDetailPage extends StatelessWidget {
  const TrainingMainDetailPage(this.trains, {super.key});
  final List<Trainings> trains;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: const Text(
          'TrainingMainDetailPage',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: TrainingWidget(trains),
    );
  }
}
