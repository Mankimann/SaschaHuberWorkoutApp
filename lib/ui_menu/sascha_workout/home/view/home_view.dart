import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/home/cubit/home_cubit.dart';
import 'package:fitness_app/home/home.dart';
import 'package:fitness_app/training_plan_week_overview/view/training_plan_week_overview_page.dart';
import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:fitness_app/training_plans_overview/view/training_plans_overview_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  static Route route(HomeCubit weatherCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: HomeView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.failure:
              return const Center(
                  child: AutoSizeText('Oops something went wrong!'));
            case HomeStatus.success:
              return _HomeView(trainingPlan: state.items);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TrainingPlansOverviewPage();
            }),
          ),
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0))),
        label: const AutoSizeText(
          'WÄHLE DEINEN TRAININGSPLAN',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
        ),
        backgroundColor: Color.fromRGBO(197, 0, 14, 1),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key key, this.trainingPlan}) : super(key: key);

  final TrainingPlan trainingPlan;

  @override
  Widget build(BuildContext context) {
    var widthClip = MediaQuery.of(context).size.width * 0.09;
    var heightClip = 10.0;
    var paddingHeight = MediaQuery.of(context).size.width * 0.65;
    var random = Random();
    var motivationNumber = random.nextInt(4);
    var motivationImagePath = 'assets/sascha/Bild13.jpeg';

    switch (motivationNumber) {
      case 1:
        motivationImagePath = 'assets/sascha/Bild2.jpeg';
        break;
      case 2:
        motivationImagePath = 'assets/sascha/Bild3.jpeg';
        break;
      case 3:
        motivationImagePath = 'assets/sascha/Bild9.jpeg';
        break;
      default:
        motivationImagePath = 'assets/sascha/Bild2.jpeg';
    }

    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(motivationImagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (motivationNumber == 1)
                motivationOne(paddingHeight)
              else if (motivationNumber == 2)
                motivationTwo(paddingHeight)
              else
                motivationThree(paddingHeight),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        color: Colors.black,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 10),
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
                                trainingPlan == null
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 0, 10),
                                            child: Container(
                                              child: const AutoSizeText(
                                                'OH NEIN!',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 45,
                                                    color: Color.fromRGBO(
                                                        249, 253, 20, 1),
                                                    fontFamily: 'Raleway'),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 0, 10),
                                            child: Container(
                                              child: const AutoSizeText(
                                                'AKTUELL IST KEIN ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 30,
                                                    color: Color.fromRGBO(
                                                        249, 253, 20, 1),
                                                    fontFamily: 'Raleway'),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 0, 10),
                                            child: Container(
                                              child: const AutoSizeText(
                                                'TRAININGSPLAN AKTIV ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 30,
                                                    color: Color.fromRGBO(
                                                        249, 253, 20, 1),
                                                    fontFamily: 'Raleway'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return TrainingPlanWeekOverviewPage(
                                                  trainingPlan);
                                            }),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 25, 10),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            color: Colors.white,
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 10),
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    title: AutoSizeText(
                                                      trainingPlan.name,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w900,
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
                                                    padding: const EdgeInsets
                                                        .fromLTRB(17, 0, 20, 5),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const AutoSizeText(
                                                              'Mo',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Container(
                                                              width: widthClip,
                                                              height:
                                                                  heightClip,
                                                              color: trainingPlan
                                                                          .mondayVideo
                                                                          .isRestday ==
                                                                      true
                                                                  ? Colors.grey
                                                                  : Color
                                                                      .fromRGBO(
                                                                          197,
                                                                          0,
                                                                          14,
                                                                          1),
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
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Container(
                                                              width: widthClip,
                                                              height:
                                                                  heightClip,
                                                              color: trainingPlan
                                                                          .tuesdayVideo
                                                                          .isRestday ==
                                                                      true
                                                                  ? Colors.grey
                                                                  : Color
                                                                      .fromRGBO(
                                                                          197,
                                                                          0,
                                                                          14,
                                                                          1),
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
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Container(
                                                              width: widthClip,
                                                              height:
                                                                  heightClip,
                                                              color: trainingPlan
                                                                          .wednesdayVideo
                                                                          .isRestday ==
                                                                      true
                                                                  ? Colors.grey
                                                                  : Color
                                                                      .fromRGBO(
                                                                          197,
                                                                          0,
                                                                          14,
                                                                          1),
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
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Container(
                                                              width: widthClip,
                                                              height:
                                                                  heightClip,
                                                              color: trainingPlan
                                                                          .thursdayVideo
                                                                          .isRestday ==
                                                                      true
                                                                  ? Colors.grey
                                                                  : Color
                                                                      .fromRGBO(
                                                                          197,
                                                                          0,
                                                                          14,
                                                                          1),
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
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Container(
                                                              width: widthClip,
                                                              height:
                                                                  heightClip,
                                                              color: trainingPlan
                                                                          .fridayVideo
                                                                          .isRestday ==
                                                                      true
                                                                  ? Colors.grey
                                                                  : Color
                                                                      .fromRGBO(
                                                                          197,
                                                                          0,
                                                                          14,
                                                                          1),
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
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Container(
                                                              width: widthClip,
                                                              height:
                                                                  heightClip,
                                                              color: trainingPlan
                                                                          .saturdayVideo
                                                                          .isRestday ==
                                                                      true
                                                                  ? Colors.grey
                                                                  : Color
                                                                      .fromRGBO(
                                                                          197,
                                                                          0,
                                                                          14,
                                                                          1),
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
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Container(
                                                              width: widthClip,
                                                              height:
                                                                  heightClip,
                                                              color: trainingPlan
                                                                          .saturdayVideo
                                                                          .isRestday ==
                                                                      true
                                                                  ? Colors.grey
                                                                  : Color
                                                                      .fromRGBO(
                                                                          197,
                                                                          0,
                                                                          14,
                                                                          1),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget motivationThree(double paddingHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, paddingHeight.toDouble(), 20, 0),
          child: Card(
            color: const Color.fromRGBO(197, 0, 14, 1),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AutoSizeText(
                'JO FREUNDE',
                style: GoogleFonts.robotoCondensed(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                    backgroundColor: Color.fromRGBO(197, 0, 14, 1),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Card(
            color: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AutoSizeText(
                'WIE GEHT ES EUCH?',
                style: GoogleFonts.robotoCondensed(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Card(
            color: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AutoSizeText(
                'ICH HOFFE GUT!',
                style: GoogleFonts.robotoCondensed(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    backgroundColor: Colors.black,
                  ),
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget motivationTwo(double paddingHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, paddingHeight.toDouble(), 20, 0),
          child: const Card(
            color: Color.fromRGBO(197, 0, 14, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AutoSizeText(
                'DIE HÄRTESTEN WEGE',
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
          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AutoSizeText(
                'FÜHREN ZU DEN',
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AutoSizeText(
                'SCHÖNSTEN PLÄTZEN',
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
      ],
    );
  }

  Widget motivationOne(double paddingHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, paddingHeight.toDouble(), 20, 0),
          child: const Card(
            color: Color.fromRGBO(197, 0, 14, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AutoSizeText(
                'Wer die Beine',
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
          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AutoSizeText(
                'nicht ehrt ist den',
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AutoSizeText(
                'Bizeps nicht wert',
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
