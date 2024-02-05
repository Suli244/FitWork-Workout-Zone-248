import 'package:hive_flutter/hive_flutter.dart';
part 'sleep_model.g.dart';

@HiveType(typeId: 5)
class ModelXMan {
  @HiveField(0)
  final DateTime startDate;
  
  @HiveField(1)
  final DateTime endDate;

  @HiveField(2)
  final int date;
  ModelXMan({
    required this.startDate,
    required this.endDate,
    required this.date,
  });

  @override
  String toString() => 'ModelXMan(startDate: $startDate, endDate: $endDate)';
}
