import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/home/home.dart';
import 'package:fitness_app/home/models/current_trainingsplan.dart';
import 'package:fitness_app/home/view/home_view.dart';
import 'package:fitness_app/training_plan_choosen/cubit/training_plan_choosen_cubit.dart';
import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:fitness_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository.dart';

class TrainingPlanChoosenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarGlobal.buildAppBar(context, 'Dein neuer Plan'),
      ),
      body: BlocBuilder<TrainingPlanChoosenCubit, TrainingPlan>(
        builder: (context, state) {
          return _TrainingsplanChoosenView(trainingPlan: state);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0))),
        label: const AutoSizeText(
          'STARTE DEIN TRAINING JETZT',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
        ),
        backgroundColor: Color.fromRGBO(197, 0, 14, 1),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              HomeView.route(HomeCubit(repository: Repository())..fetchList()),
              (route) => false);
        },
      ),
    );
  }
}

class _TrainingsplanChoosenView extends StatelessWidget {
  const _TrainingsplanChoosenView({Key key, this.trainingPlan})
      : super(key: key);

  final TrainingPlan trainingPlan;

  void addTrainingPlanToLocalStorage(String trainingPlanId) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('currentTraining', trainingPlanId);
      print(prefs.getString('currentTraining'));
    } catch (e) {
      print('Ups $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var widthClip = MediaQuery.of(context).size.width * 0.09;
    var heightClip = 10.0;
    var paddingHeight = MediaQuery.of(context).size.width * 0.5;
    addTrainingPlanToLocalStorage(trainingPlan.id);
    return trainingPlan == null
        ? const Center(child: AutoSizeText('no content'))
        : Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sascha/Bild12.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, paddingHeight, 20, 5),
                      child: const Card(
                        color: Color.fromRGBO(197, 0, 14, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0))),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: AutoSizeText(
                            'DEIN NEUER PLAN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              backgroundColor: Color.fromRGBO(197, 0, 14, 1),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                      child: Card(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0))),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: AutoSizeText(
                            'IST READY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              backgroundColor: Colors.black,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                      child: Card(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0))),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: AutoSizeText(
                            'DU AUCH?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              backgroundColor: Colors.black,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Container(
                            height: 85.0,
                            width: 300,
                            color: Colors.black,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 10, 0, 10),
                                      child: Container(
                                        child: const AutoSizeText(
                                          'Dein aktueller Plan:',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontFamily: 'Raleway'),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 0, 25, 10),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 10),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                17, 0, 20, 5),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    const AutoSizeText(
                                                      'Mo',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: widthClip,
                                                      height: heightClip,
                                                      color: trainingPlan
                                                                  .mondayVideo
                                                                  .isRestday ==
                                                              true
                                                          ? Colors.grey
                                                          : Color.fromRGBO(
                                                              197, 0, 14, 1),
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
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: widthClip,
                                                      height: heightClip,
                                                      color: trainingPlan
                                                                  .tuesdayVideo
                                                                  .isRestday ==
                                                              true
                                                          ? Colors.grey
                                                          : Color.fromRGBO(
                                                              197, 0, 14, 1),
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
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: widthClip,
                                                      height: heightClip,
                                                      color: trainingPlan
                                                                  .wednesdayVideo
                                                                  .isRestday ==
                                                              true
                                                          ? Colors.grey
                                                          : Color.fromRGBO(
                                                              197, 0, 14, 1),
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
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: widthClip,
                                                      height: heightClip,
                                                      color: trainingPlan
                                                                  .thursdayVideo
                                                                  .isRestday ==
                                                              true
                                                          ? Colors.grey
                                                          : Color.fromRGBO(
                                                              197, 0, 14, 1),
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
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: widthClip,
                                                      height: heightClip,
                                                      color: trainingPlan
                                                                  .fridayVideo
                                                                  .isRestday ==
                                                              true
                                                          ? Colors.grey
                                                          : Color.fromRGBO(
                                                              197, 0, 14, 1),
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
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: widthClip,
                                                      height: heightClip,
                                                      color: trainingPlan
                                                                  .saturdayVideo
                                                                  .isRestday ==
                                                              true
                                                          ? Colors.grey
                                                          : Color.fromRGBO(
                                                              197, 0, 14, 1),
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
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      width: widthClip,
                                                      height: heightClip,
                                                      color: trainingPlan
                                                                  .saturdayVideo
                                                                  .isRestday ==
                                                              true
                                                          ? Colors.grey
                                                          : Color.fromRGBO(
                                                              197, 0, 14, 1),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({
    Key key,
    @required this.item,
    @required this.onDeletePressed,
  }) : super(key: key);

  final CurrentTrainingPlan item;
  final ValueSetter<String> onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AutoSizeText('#${item.trainingPlan.name}'),
      title: AutoSizeText(item.trainingPlan.name),
    );
  }
}
