import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/screen/pages/home/home_cubit/home_cubit.dart';
import 'package:workout_zone_248/screen/pages/home/home_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
            bloc: HomeCubit()..getData(),
            builder: (context, state) => state.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (data) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Text(
                            'Hello!',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff706B6A),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Let\'s Workout',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff25140F),
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff706B6A),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(
                            height: 8,
                            color: Color(0xffF1F1F1),
                          ),
                          const SizedBox(height: 30),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              int totalCalories = 0;
                              int totalMin = 0;
                              for (var element in data.workouts) {
                                totalCalories += element.calories;
                                totalMin += element.minutes;
                              }
                              return Row(
                                children: [
                                  Text(
                                    index == 0
                                        ? data.calories.toString()
                                        : index == 1
                                            ? data.steps.toString()
                                            : index == 2
                                                ? data.km.toString()
                                                : data.activeMinutes.toString(),
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff25140F),
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    index == 0
                                        ? 'Calories'
                                        : index == 1
                                            ? 'Steps'
                                            : index == 2
                                                ? 'km'
                                                : 'Active minutes',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff706B6A),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 36,
                                    width: 82,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 7,
                                          height: index == 0
                                              ? data.calories == 0
                                                  ? 4
                                                  : 20
                                              : index == 1
                                                  ? data.steps == 0
                                                      ? 4
                                                      : 14
                                                  : index == 2
                                                      ? data.km == 0
                                                          ? 4
                                                          : 12
                                                      : data.activeMinutes == 0
                                                          ? 4
                                                          : 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: index == 0
                                                ? data.calories == 0
                                                    ? const Color(0xffF1F1F1)
                                                    : const Color(0xff590085)
                                                : index == 1
                                                    ? data.steps == 0
                                                        ? const Color(
                                                            0xffF1F1F1)
                                                        : const Color(
                                                            0xff590085)
                                                    : index == 2
                                                        ? data.km == 0
                                                            ? const Color(
                                                                0xffF1F1F1)
                                                            : const Color(
                                                                0xff590085)
                                                        : data.activeMinutes ==
                                                                0
                                                            ? const Color(
                                                                0xffF1F1F1)
                                                            : const Color(
                                                                0xff590085),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                            width: 7,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF1F1F1),
                                                borderRadius:
                                                    BorderRadius.circular(2))),
                                        const SizedBox(width: 8),
                                        Container(
                                            width: 7,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF1F1F1),
                                                borderRadius:
                                                    BorderRadius.circular(2))),
                                        const SizedBox(width: 8),
                                        Container(
                                            width: 7,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF1F1F1),
                                                borderRadius:
                                                    BorderRadius.circular(2))),
                                        const SizedBox(width: 8),
                                        Container(
                                            width: 7,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF1F1F1),
                                                borderRadius:
                                                    BorderRadius.circular(2))),
                                        const SizedBox(width: 8),
                                        Container(
                                            width: 7,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF1F1F1),
                                                borderRadius:
                                                    BorderRadius.circular(2))),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 32.h),
                            itemCount: 4,
                          ),
                          SizedBox(height: 40.h),
                          const Text(
                            'Upcoming Workout',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff706B6A),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          ListView.separated(
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 4);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeDetailPage(
                                        trainModel: data.workouts[index],
                                        index: index,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    const Divider(
                                      thickness: 3,
                                      color: Color(0xffF1F1F1),
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            data.workouts[index].image,
                                            width: 72,
                                            fit: BoxFit.cover,
                                            height: 72,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data.workouts[index].title,
                                                style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff25140F),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                maxLines: 2,
                                              ),
                                              Text(
                                                '${data.workouts[index].minutes} min • ${data.workouts[index].calories} kcal',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff706B6A),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (data.workouts[index].isComplete)
                                          const Icon(
                                            Icons.check_sharp,
                                            size: 20,
                                            color: Color(0xff590085),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                  error: (e) => Text(e),
                )),
      ),
    );
  }
}
