import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/dafsas/asfafsag.dart';
import 'package:workout_zone_248/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:workout_zone_248/screen/onboarding/widget/button_widget.dart';
import 'package:workout_zone_248/screen/sadgas/widget/premium_item_widget.dart';
import 'package:workout_zone_248/screen/sadgas/widget/restore_widgets.dart';
import 'package:workout_zone_248/sdgsdg/sdd/afsfasfas.dart';

class DFsdgsgs extends StatefulWidget {
  const DFsdgsgs({super.key, this.isPop = false});
  final bool isPop;

  @override
  State<DFsdgsgs> createState() => _DFsdgsgsState();
}

class _DFsdgsgsState extends State<DFsdgsgs> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                Dvsdsd.premium,
                width: 390.w,
                height: 546.h,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
          Positioned(
            top: 70,
            right: 30,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.5),
              radius: 15,
              child: InkWell(
                onTap: () {
                  if (widget.isPop) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigatorScreen(),
                      ),
                      (pred) => false,
                    );
                  }
                },
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PREMIUM ACCESS:',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'ro',
                      color: AppColorsWorkoutZone.color25140F,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  const PremiumItemWidget(
                    title: 'Get access to personalized\nworkouts!',
                  ),
                  SizedBox(height: 16.h),
                  const PremiumItemWidget(
                    title:
                        'Get access to personalized\nnutrition recommendations!',
                  ),
                  SizedBox(height: 24.h),
                  ButtonWidget(
                    color: AppColorsWorkoutZone.color590085,
                    onPress: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final apphudPaywalls = await Apphud.paywalls();
                      print(apphudPaywalls);

                      await Apphud.purchase(
                        product: apphudPaywalls?.paywalls.first.products?.first,
                      ).whenComplete(
                        () async {
                          if (await Apphud.hasPremiumAccess() ||
                              await Apphud.hasActiveSubscription()) {
                            final hasPremiumAccess =
                                await Apphud.hasPremiumAccess();
                            final hasActiveSubscription =
                                await Apphud.hasActiveSubscription();
                            if (hasPremiumAccess || hasActiveSubscription) {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('ISBUY', true);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Success!'),
                                  content: const Text(
                                      'Your purchase has been restored!'),
                                  actions: [
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const BottomNavigatorScreen(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Restore purchase'),
                                  content: const Text(
                                      'Your purchase is not found. Write to support: https://docs.google.com/forms/d/e/1FAIpQLSe2dY5sixywVpTYU9K34aEqYi67rDquTx9XMeDZWeU2de_rag/viewform?usp=sf_link'),
                                  actions: [
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      onPressed: () =>
                                          {Navigator.of(context).pop()},
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            }
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const BottomNavigatorScreen(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                      );
                      setState(() {
                        isLoading = false;
                      });
                    },
                    text: 'BUY PREMIUM FOR \$0.99',
                    radius: 16,
                    height: 72.h,
                  ),
                  SizedBox(height: 20.h),
                  const RestoreButtons(),
                  SizedBox(height: 45.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
