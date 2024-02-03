import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workout_zone_248/screen/pages/workouts/child_pages/training_detail_page.dart';
import 'package:workout_zone_248/screen/pages/workouts/state/models/workouts_model.dart';

class WorkoutDetailPage extends StatefulWidget {
  const WorkoutDetailPage(this.trainModels, {super.key});

  final List<Trainings> trainModels;

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  List<Trainings> beginnerTrainings = [];
  List<Trainings> advancedTrainings = [];
  List<Trainings> allTrainings = [];
  @override
  void initState() {
    super.initState();
    beginnerTrainings = widget.trainModels
        .where((training) => training.level == 'Beginner')
        .toList();

    advancedTrainings = widget.trainModels
        .where((training) => training.level == 'Advanced')
        .toList();

    allTrainings = widget.trainModels;

    log('data: allTrainings: $allTrainings ');
    log('data: advancedTrainings: $advancedTrainings ');
    log('data: beginnerTrainings: $beginnerTrainings ');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("AppMaking.com"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xffF1F1F1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: TabBar(
                  onTap: (index) {},
                  // controller: widget.tabBar,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xff590085),
                  ),
                  labelColor: Colors.white,
                  isScrollable: false,
                  padding: const EdgeInsets.all(0),
                  indicatorPadding: const EdgeInsets.all(0),
                  unselectedLabelStyle: const TextStyle(fontSize: 16),
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                  ),
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Beginners'),
                    Tab(text: 'Advanced'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TrainingWidget(allTrainings),
            TrainingWidget(beginnerTrainings),
            TrainingWidget(advancedTrainings),
          ],
        ),
      ),
    );
  }
}

class TrainingWidget extends StatelessWidget {
  const TrainingWidget(this.trains, {super.key});

  final List<Trainings> trains;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ).copyWith(top: 34),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Core',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff706B6A),
                ),
              ),
              Text(
                '${trains.length} Workouts',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff706B6A),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: trains.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 4);
              },
              itemBuilder: (BuildContext context, int index) {
                final telo = trains[index];
                log('data: telo.image: ${telo.image} ');
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrainingDetailScreen(telo),
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
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://i.ibb.co/C7Gs0LM/Rectangle-20.png',
                              width: 72,
                              fit: BoxFit.cover,
                              height: 72,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                telo.title,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff25140F),
                                ),
                              ),
                              Text(
                                '${telo.minutes} min • ${telo.calories} kcal',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff706B6A),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
