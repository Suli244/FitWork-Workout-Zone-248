import 'package:hive/hive.dart';
import 'package:workout_zone_248/screen/pages/workouts/state/models/workouts_model.dart'
    as model;

part 'home_model.g.dart';

@HiveType(typeId: 2)
class HomeModel extends HiveObject {
  @HiveField(0)
  int day;

  @HiveField(1)
  int calories;

  @HiveField(2)
  int km;

  @HiveField(3)
  int steps;

  @HiveField(4)
  int activeMinutes;

  @HiveField(5)
  List<Trainings> workouts;

  HomeModel({
    required this.day,
    required this.calories,
    required this.km,
    required this.steps,
    required this.activeMinutes,
    required this.workouts,
  });
}

@HiveType(typeId: 3)
class Trainings {
  @HiveField(0)
  String description;

  @HiveField(1)
  int calories;

  @HiveField(2)
  String level;

  @HiveField(3)
  int minutes;

  @HiveField(4)
  String title;
  @HiveField(5)
  String image;
  @HiveField(6)
  bool isComplete;
  Trainings({
    required this.calories,
    required this.description,
    required this.level,
    required this.minutes,
    required this.title,
    required this.image,
    required this.isComplete,
  });

  factory Trainings.fromModle(model.Trainings trainings) {
    return Trainings(
      description: trainings.description,
      calories: trainings.calories,
      level: trainings.level,
      minutes: trainings.minutes,
      title: trainings.title,
      image: trainings.image,
      isComplete: false,
    );
  }
}
