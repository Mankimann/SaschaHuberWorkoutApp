import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/training_plan_week_overview/view/training_plan_week_overview_page.dart';
import 'package:fitness_app/training_plans_overview/cubit/training_plans_overview_cubit.dart';
import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:fitness_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingPlansOverviewView extends StatelessWidget {
  static Route route(TrainingPlansOverviewCubit weatherCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: TrainingPlansOverviewView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarGlobal.buildAppBar(context, 'Alle Trainingspläne:'),
      ),
      body: BlocBuilder<TrainingPlansOverviewCubit, TrainingPlansOverviewState>(
        builder: (context, state) {
          switch (state.status) {
            case TrainingPlansOverviewStatus.failure:
              return const Center(
                  child: AutoSizeText('Oops something went wrong!'));
            case TrainingPlansOverviewStatus.success:
              return _TraininsplaeneOverviewPageView(items: state.items);
            default:
              return Container(
                color: Colors.black87,
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(197, 0, 14, 1)),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}

class _TraininsplaeneOverviewPageView extends StatelessWidget {
  const _TraininsplaeneOverviewPageView({Key key, this.items})
      : super(key: key);

  final List<TrainingPlan> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Center(child: AutoSizeText('no content'))
        : Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
            color: Colors.black87,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _ItemTile(
                  trainingPlan: items[index],
                );
              },
              itemCount: items.length,
            ),
          );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({
    Key key,
    @required this.trainingPlan,
  }) : super(key: key);

  final TrainingPlan trainingPlan;

  @override
  Widget build(BuildContext context) {
    var widthClip = MediaQuery.of(context).size.width * 0.09;
    var heightClip = 10.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return TrainingPlanWeekOverviewPage(trainingPlan);
          }),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        color: Colors.white,
        child: Column(children: [
          ListTile(
            title: AutoSizeText(
              trainingPlan.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 23),
            ),
            isThreeLine: true,
            subtitle: AutoSizeText(
              trainingPlan.description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 0, 20, 5),
            child: Row(
              children: [
                Column(
                  children: [
                    const AutoSizeText(
                      'Mo',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      width: widthClip,
                      height: heightClip,
                      color: trainingPlan.mondayVideo.isRestday == true
                          ? Colors.grey
                          : Color.fromRGBO(197, 0, 14, 1),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    const AutoSizeText(
                      'Di',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      width: widthClip,
                      height: heightClip,
                      color: trainingPlan.tuesdayVideo.isRestday == true
                          ? Colors.grey
                          : Color.fromRGBO(197, 0, 14, 1),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    const AutoSizeText(
                      'Mi',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      width: widthClip,
                      height: heightClip,
                      color: trainingPlan.wednesdayVideo.isRestday == true
                          ? Colors.grey
                          : Color.fromRGBO(197, 0, 14, 1),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    const AutoSizeText(
                      'Do',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      width: widthClip,
                      height: heightClip,
                      color: trainingPlan.thursdayVideo.isRestday == true
                          ? Colors.grey
                          : Color.fromRGBO(197, 0, 14, 1),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    const AutoSizeText(
                      'Fr',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      width: widthClip,
                      height: heightClip,
                      color: trainingPlan.fridayVideo.isRestday == true
                          ? Colors.grey
                          : Color.fromRGBO(197, 0, 14, 1),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    const AutoSizeText(
                      'Sa',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      width: widthClip,
                      height: heightClip,
                      color: trainingPlan.saturdayVideo.isRestday == true
                          ? Colors.grey
                          : Color.fromRGBO(197, 0, 14, 1),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    const AutoSizeText(
                      'So',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      width: widthClip,
                      height: heightClip,
                      color: trainingPlan.saturdayVideo.isRestday == true
                          ? Colors.grey
                          : Color.fromRGBO(197, 0, 14, 1),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
