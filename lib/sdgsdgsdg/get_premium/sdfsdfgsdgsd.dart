import 'package:hive/hive.dart';
import 'package:workout_zone_248/sdgsdgsdg/get_premium/sdsdfdsg/prem_hive_model.dart';

class JYKUJHfjkn {
  Future<JHgjkJHd?> sdfdsdg() async {
    final box = await Hive.openBox<JHgjkJHd>('prem');
    final result = box.get('keyPrem');
    return result;
  }

  hfdhfdfd(JHgjkJHd model) async {
    final box = await Hive.openBox<JHgjkJHd>('prem');
    box.put('keyPrem', model);
  }
}
