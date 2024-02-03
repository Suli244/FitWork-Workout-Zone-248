// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'kcal_hive_model.g.dart';

@HiveType(typeId: 1)
class KCalHiveModel extends HiveObject {
  @HiveField(0)
  int calory;

  @HiveField(1)
  String date;

  @HiveField(2)
  String type;

  @HiveField(3)
  int carbs;

  @HiveField(4)
  int protein;

  @HiveField(5)
  int fats;

  KCalHiveModel({
    required this.calory,
    required this.date,
    required this.type,
    required this.carbs,
    required this.protein,
    required this.fats,
  });

  @override
  String toString() {
    return 'KCalHiveModel(calory: $calory, date: $date, type: $type, carbs: $carbs, protein: $protein, fats: $fats)';
  }
}
