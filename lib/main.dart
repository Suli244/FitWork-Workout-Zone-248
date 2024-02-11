import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_zone_248/screen/pages/home/models/home_model.dart';
import 'package:workout_zone_248/screen/pages/sleep/model/sleep_model.dart';
import 'package:workout_zone_248/screen/sdgag/gsdafgsdg.dart';
import 'package:workout_zone_248/sdgsdgsdg/get_premium/sdsdfdsg/prem_hive_model.dart';
import 'package:workout_zone_248/sdgsdgsdg/sdfsdf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: 'app_eqfE4E5VmLskvtxjnshdyZL7ZJZ8Zu');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(HomeModelAdapter());
  Hive.registerAdapter(ModelXManAdapter());
  Hive.registerAdapter(TrainingsAdapter());
  Hive.registerAdapter(JHgjkJHdAdapter());
  sddggsg();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Workout Zone',
        home: child,
        theme: ThemeData.light().copyWith(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
      ),
      child: const SGedfsdgs(),
    );
  }
}
