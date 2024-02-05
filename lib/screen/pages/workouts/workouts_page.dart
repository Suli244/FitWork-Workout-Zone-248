import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/screen/pages/workouts/child_pages/training_main_detail_page.dart';
import 'package:workout_zone_248/screen/pages/workouts/child_pages/workout_detail_page.dart';
import 'package:workout_zone_248/screen/pages/workouts/state/cubit/workouts_cubit.dart';
import 'package:workout_zone_248/screen/pages/workouts/state/models/workouts_model.dart';
import 'package:workout_zone_248/screen/sadgas/sddga.dart';
import 'package:workout_zone_248/sdgsdg/sdd/afsfasfas.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({super.key});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  bool isSoonun = true;
  @override
  void initState() {
    super.initState();
    context.read<WorkoutsCubit>().getData();
    getMoreBirSerse();
  }

  getMoreBirSerse() async {
    final prefs = await SharedPreferences.getInstance();
    isSoonun = prefs.getBool('ISBUY') ?? false;
    setState(() {});
  }

  List gridList = [2, 4, 2, 2, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WorkoutsCubit, WorkoutsState>(
          builder: (context, state) {
            return state.when(
              searched: (models) {
                return WorkoutsGridWidget(models);
              },
              initial: () => const SizedBox.shrink(),
              loading: () {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator.adaptive(),
                    ],
                  ),
                );
              },
              success: (models, searching) {
                List<Workouts> filtered = [];
                if (searching == false && models.isNotEmpty) {
                  filtered = List<Workouts>.from(models)..removeAt(0);
                } else {
                  filtered = models;
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Workouts',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        onChanged: (value) {
                          context.read<WorkoutsCubit>().searchList(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 15),
                              Image.asset(
                                Dvsdsd.searchIcon,
                                // color: Colors.red,
                                scale: 4,
                              ),
                            ],
                          ),
                          contentPadding: const EdgeInsets.only(left: 50),
                          isDense: true, //
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Color(0xff706B6A),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                              color: Color(0xff706B6A),
                            ),
                          ),
                          hintText: 'Search',
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (models.isNotEmpty &&
                          models.first.isSatypAluu &&
                          !isSoonun)
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xffF1F1F1),
                              ),
                              height: 72,
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Image.asset(
                                    Dvsdsd.lockIconRoz,
                                    scale: 3,
                                  ),
                                  const SizedBox(width: 16),
                                  const Expanded(
                                    child: Text(
                                      'Unlock PRO and get access to personalized workouts!',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: searching
                            ? const SizedBox.shrink()
                            : GestureDetector(
                                onTap: () {
                                  if (models.isNotEmpty &&
                                      models.first.isSatypAluu &&
                                      !isSoonun) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DFsdgsgs()),
                                    );
                                  } else {
                                    if (models.isNotEmpty) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrainingMainDetailPage(
                                            models.first.trainings,
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  height: 216,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        models.isNotEmpty
                                            ? models.first.mainImage
                                            : '',
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              models.isNotEmpty
                                                  ? models.first.title
                                                  : '',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                models.isNotEmpty
                                                    ? models.first
                                                            .description ??
                                                        ''
                                                    : '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 34,
                                                  fontWeight: FontWeight.w700,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${models.isNotEmpty ? models.first.time : ''} min',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          if (models.isNotEmpty &&
                                              models.first.isSatypAluu &&
                                              !isSoonun)
                                            Image.asset(
                                              Dvsdsd.lockIconRoz,
                                              scale: 3,
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),

                      //--------------
                      if (!searching) const SizedBox(height: 24),
                      Text(
                        searching ? 'Searching' : 'Categories',
                        style: const TextStyle(
                          color: Color(0xff706B6A),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Color(0xffF1F1F1),
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: filtered.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final model = filtered[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      WorkoutDetailPage(model.trainings),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(model.mainImage),
                                ),
                              ),
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34.h,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              error: (v) {
                return Text('Error $v');
              },
            );
          },
        ),
      ),
    );
  }
}

class WorkoutsGridWidget extends StatelessWidget {
  const WorkoutsGridWidget(this.model, {super.key});
  final List<Workouts> model;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: model.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final modelOne = model[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(modelOne.mainImage),
            ),
          ),
          padding: const EdgeInsets.all(8),
          alignment: Alignment.bottomCenter,
          child: Text(
            modelOne.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }
}
