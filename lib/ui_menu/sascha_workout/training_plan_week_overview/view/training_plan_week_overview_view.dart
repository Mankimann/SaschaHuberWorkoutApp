import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/training_plan_choosen/view/training_plan_choosen_page.dart';
import 'package:fitness_app/training_plan_week_overview/cubit/training_plan_week_overview_cubit.dart';
import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:fitness_app/video/view/video_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class TrainingPlanWeekOverviewView extends StatelessWidget {
  TrainingPlan trainingPlan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: BlocBuilder<TrainingPlanWeekOverviewCubit,
          TrainingPlanWeekOverviewState>(
        builder: (context, state) {
          switch (state.status) {
            case TrainingPlanWeekOverviewStatus.failure:
              return const Center(
                child: AutoSizeText('Oops something went wrong!'),
              );
            case TrainingPlanWeekOverviewStatus.success:
              trainingPlan = state.items;
              return _TraininsplanWeekOverviewPageView(items: state.items);
            default:
              return Container(
                color: Colors.black87,
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return TrainingPlanChoosenPage(trainingPlan);
          }),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
        ),
        label: const AutoSizeText(
          'DIESEN PLAN AKTIVIEREN',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class _TraininsplanWeekOverviewPageView extends StatelessWidget {
  const _TraininsplanWeekOverviewPageView({Key key, this.items})
      : super(key: key);

  final TrainingPlan items;

  @override
  Widget build(BuildContext context) {
    return items == null
        ? const Center(child: AutoSizeText('no content'))
        : Container(
            height: MediaQuery.of(context).size.height * 0.75,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
            color: Colors.black87,
            child: ListView(
              children: [
                _ItemTile(
                  item: items,
                ),
              ],
            ),
          );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({
    Key key,
    @required this.item,
  }) : super(key: key);

  final TrainingPlan item;

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    var twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).toInt());
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes';
  }

  @override
  Widget build(BuildContext context) {
    print(item.mondayVideo.id);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            item.mondayVideo.isRestday == true
                ? Flushbar(
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    title: 'Ruh Dich aus',
                    message:
                        'Neben Training und Ernährung ist Regeneration, die dritte wichtigste Säule für den Muskelaufbau!',
                    duration: const Duration(seconds: 7),
                  ).show(context)
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return VideoPage(item.mondayVideo);
                    }),
                  );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Colors.white,
            child: Column(
              children: [
                item.mondayVideo.isRestday == false
                    ? const ListTile(
                        title: AutoSizeText(
                          'Montag',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      )
                    : const ListTile(
                        title: AutoSizeText(
                          'Montag (Ruhetag)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      ),
                item.mondayVideo.isRestday == false
                    ? Image(
                        image: NetworkImage(
                          YoutubePlayerController.getThumbnail(
                            videoId: item.mondayVideo.id,
                            quality: ThumbnailQuality.high,
                          ),
                        ),
                      )
                    : const Image(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1534276866337-55723bdee569?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80'),
                      ),
                item.mondayVideo.isRestday == false
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Zeit ${_printDuration(item.mondayVideo.trainingTime)}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                item.mondayVideo.needBook
                                    ? Image.asset(
                                        'assets/equidment/buch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.mondayVideo.needChair
                                    ? Image.asset(
                                        'assets/equidment/stuhl.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.mondayVideo.needDumbbell
                                    ? Image.asset(
                                        'assets/equidment/hantel.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.mondayVideo.needTowel
                                    ? Image.asset(
                                        'assets/equidment/handtuch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            item.tuesdayVideo.isRestday == true
                ? Flushbar(
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    title: 'Ruh Dich aus',
                    message:
                        'Neben Training und Ernährung ist Regeneration, die dritte wichtigste Säule für den Muskelaufbau!',
                    duration: const Duration(seconds: 7),
                  ).show(context)
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return VideoPage(item.tuesdayVideo);
                    }),
                  );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Colors.white,
            child: Column(
              children: [
                item.tuesdayVideo.isRestday == false
                    ? const ListTile(
                        title: AutoSizeText(
                          'Dienstag',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      )
                    : const ListTile(
                        title: AutoSizeText(
                          'Dienstag (Ruhetag)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      ),
                item.tuesdayVideo.isRestday == false
                    ? Image(
                        image: NetworkImage(
                            YoutubePlayerController.getThumbnail(
                                videoId: item.tuesdayVideo.id,
                                quality: ThumbnailQuality.high)),
                      )
                    : Container(),
                item.tuesdayVideo.isRestday == false
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Zeit ${_printDuration(item.tuesdayVideo.trainingTime)}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                item.tuesdayVideo.needBook
                                    ? Image.asset(
                                        'assets/equidment/buch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.tuesdayVideo.needChair
                                    ? Image.asset(
                                        'assets/equidment/stuhl.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.tuesdayVideo.needDumbbell
                                    ? Image.asset(
                                        'assets/equidment/hantel.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.tuesdayVideo.needTowel
                                    ? Image.asset(
                                        'assets/equidment/handtuch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            item.wednesdayVideo.isRestday == true
                ? Flushbar(
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    title: 'Ruh Dich aus',
                    message:
                        'Neben Training und Ernährung ist Regeneration, die dritte wichtigste Säule für den Muskelaufbau!',
                    duration: const Duration(seconds: 7),
                  ).show(context)
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return VideoPage(item.wednesdayVideo);
                    }),
                  );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Colors.white,
            child: Column(
              children: [
                item.wednesdayVideo.isRestday == false
                    ? const ListTile(
                        title: AutoSizeText(
                          'Mittwoch',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      )
                    : const ListTile(
                        title: AutoSizeText(
                          'Mittwoch (Ruhetag)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      ),
                item.wednesdayVideo.isRestday == false
                    ? Image(
                        image: NetworkImage(
                            YoutubePlayerController.getThumbnail(
                                videoId: item.wednesdayVideo.id,
                                quality: ThumbnailQuality.high)),
                      )
                    : Container(),
                item.wednesdayVideo.isRestday == false
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Zeit ${_printDuration(item.tuesdayVideo.trainingTime)}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                item.wednesdayVideo.needBook
                                    ? Image.asset(
                                        'assets/equidment/buch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.wednesdayVideo.needChair
                                    ? Image.asset(
                                        'assets/equidment/stuhl.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.wednesdayVideo.needDumbbell
                                    ? Image.asset(
                                        'assets/equidment/hantel.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.wednesdayVideo.needTowel
                                    ? Image.asset(
                                        'assets/equidment/handtuch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            item.thursdayVideo.isRestday == true
                ? Flushbar(
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    title: 'Ruh Dich aus',
                    message:
                        'Neben Training und Ernährung ist Regeneration, die dritte wichtigste Säule für den Muskelaufbau!',
                    duration: const Duration(seconds: 7),
                  ).show(context)
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return VideoPage(item.thursdayVideo);
                    }),
                  );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Colors.white,
            child: Column(
              children: [
                item.thursdayVideo.isRestday == false
                    ? const ListTile(
                        title: AutoSizeText(
                          'Donnerstag',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      )
                    : const ListTile(
                        title: AutoSizeText(
                          'Donnerstag (Ruhetag)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      ),
                item.thursdayVideo.isRestday == false
                    ? Image(
                        image: NetworkImage(
                            YoutubePlayerController.getThumbnail(
                                videoId: item.thursdayVideo.id,
                                quality: ThumbnailQuality.high)),
                      )
                    : Container(),
                item.thursdayVideo.isRestday == false
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Zeit ${_printDuration(item.tuesdayVideo.trainingTime)}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                item.thursdayVideo.needBook
                                    ? Image.asset(
                                        'assets/equidment/buch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.thursdayVideo.needChair
                                    ? Image.asset(
                                        'assets/equidment/stuhl.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.thursdayVideo.needDumbbell
                                    ? Image.asset(
                                        'assets/equidment/hantel.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.thursdayVideo.needTowel
                                    ? Image.asset(
                                        'assets/equidment/handtuch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            item.fridayVideo.isRestday == true
                ? Flushbar(
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    title: 'Ruh Dich aus',
                    message:
                        'Neben Training und Ernährung ist Regeneration, die dritte wichtigste Säule für den Muskelaufbau!',
                    duration: const Duration(seconds: 7),
                  ).show(context)
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return VideoPage(item.fridayVideo);
                    }),
                  );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Colors.white,
            child: Column(
              children: [
                item.fridayVideo.isRestday == false
                    ? const ListTile(
                        title: AutoSizeText(
                          'Freitag',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      )
                    : const ListTile(
                        title: AutoSizeText(
                          'Freitag (Ruhetag)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      ),
                item.fridayVideo.isRestday == false
                    ? Image(
                        image: NetworkImage(
                            YoutubePlayerController.getThumbnail(
                                videoId: item.fridayVideo.id,
                                quality: ThumbnailQuality.high)),
                      )
                    : Container(),
                item.fridayVideo.isRestday == false
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Zeit ${_printDuration(item.fridayVideo.trainingTime)}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                item.fridayVideo.needBook
                                    ? Image.asset(
                                        'assets/equidment/buch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.fridayVideo.needChair
                                    ? Image.asset(
                                        'assets/equidment/stuhl.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.fridayVideo.needDumbbell
                                    ? Image.asset(
                                        'assets/equidment/hantel.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.fridayVideo.needTowel
                                    ? Image.asset(
                                        'assets/equidment/handtuch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            item.saturdayVideo.isRestday == true
                ? Flushbar(
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    title: 'Ruh Dich aus',
                    message:
                        'Neben Training und Ernährung ist Regeneration, die dritte wichtigste Säule für den Muskelaufbau!',
                    duration: const Duration(seconds: 7),
                  ).show(context)
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return VideoPage(item.saturdayVideo);
                    }),
                  );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Colors.white,
            child: Column(
              children: [
                item.saturdayVideo.isRestday == false
                    ? const ListTile(
                        title: AutoSizeText(
                          'Samstag',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      )
                    : const ListTile(
                        title: AutoSizeText(
                          'Samstag (Ruhetag)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      ),
                item.saturdayVideo.isRestday == false
                    ? Image(
                        image: NetworkImage(
                            YoutubePlayerController.getThumbnail(
                                videoId: item.saturdayVideo.id,
                                quality: ThumbnailQuality.high)),
                      )
                    : Container(),
                item.saturdayVideo.isRestday == false
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Zeit ${_printDuration(item.saturdayVideo.trainingTime)}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                item.saturdayVideo.needBook
                                    ? Image.asset(
                                        'assets/equidment/buch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.saturdayVideo.needChair
                                    ? Image.asset(
                                        'assets/equidment/stuhl.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.saturdayVideo.needDumbbell
                                    ? Image.asset(
                                        'assets/equidment/hantel.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.saturdayVideo.needTowel
                                    ? Image.asset(
                                        'assets/equidment/handtuch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            item.sundayVideo.isRestday == true
                ? Flushbar(
                    flushbarStyle: FlushbarStyle.GROUNDED,
                    title: 'Ruh Dich aus',
                    message:
                        'Neben Training und Ernährung ist Regeneration, die dritte wichtigste Säule für den Muskelaufbau!',
                    duration: const Duration(seconds: 7),
                  ).show(context)
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return VideoPage(item.sundayVideo);
                    }),
                  );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Colors.white,
            child: Column(
              children: [
                item.sundayVideo.isRestday == false
                    ? const ListTile(
                        title: AutoSizeText(
                          'Sonntag',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      )
                    : const ListTile(
                        title: AutoSizeText(
                          'Sonntag (Ruhetag)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 23),
                        ),
                      ),
                item.sundayVideo.isRestday == false
                    ? Image(
                        image: NetworkImage(
                            YoutubePlayerController.getThumbnail(
                                videoId: item.tuesdayVideo.id,
                                quality: ThumbnailQuality.high)),
                      )
                    : Container(),
                item.sundayVideo.isRestday == false
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Zeit ${_printDuration(item.sundayVideo.trainingTime)}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                item.sundayVideo.needBook
                                    ? Image.asset(
                                        'assets/equidment/buch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.sundayVideo.needChair
                                    ? Image.asset(
                                        'assets/equidment/stuhl.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.sundayVideo.needDumbbell
                                    ? Image.asset(
                                        'assets/equidment/hantel.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                                item.sundayVideo.needTowel
                                    ? Image.asset(
                                        'assets/equidment/handtuch.png',
                                        width: 40,
                                        height: 40,
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
