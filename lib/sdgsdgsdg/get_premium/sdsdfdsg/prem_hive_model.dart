import 'package:hive/hive.dart';

part 'prem_hive_model.g.dart';

@HiveType(typeId: 11)
class JHgjkJHd extends HiveObject {
  @HiveField(0)
  String secondUrl;

  @HiveField(1)
  bool isOpen;
  JHgjkJHd({
    required this.secondUrl,
    required this.isOpen,
  });
}
