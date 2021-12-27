import 'dart:async';
import 'dart:math';

import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:fitness_app/video/models/video.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'list/models/item.dart';

class Repository {
  final _random = Random();

  int _randomRange(int min, int max) => min + _random.nextInt(max - min);

  Future<List<Item>> fetchItems() async {
    return List.of(_generateItemsList(10));
  }

  Future<TrainingPlan> fetchCurrentTrainingPlan() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var trainingPlanId = prefs.getString('currentTraining');
      var trainingPlanList = _generateTrainingPlansList(1);
      var list = trainingPlanList
          .indexWhere((element) => element.id == trainingPlanId);
      return trainingPlanList[list];
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<List<TrainingPlan>> fetchTrainingPlans() async {
    return List.of(_generateTrainingPlansList(1));
  }

  Future<TrainingPlan> fetchTrainingPlan() async {
    return const TrainingPlan(
      id: '2',
      name: ' Trainingsplan A (kurz)',
      description: 'Test, was für eine krasse MEGA STARKE BESCHREIBUNG!!!!!',
      mondayVideo: Video(
          id: 'T2lyoAhcnXI',
          trainingStartTime: Duration(minutes: 2),
          trainingTime: Duration(minutes: 30),
          needBook: false,
          needChair: false,
          needTowel: true,
          needDumbbell: false,
          isRestday: false),
      tuesdayVideo: Video(
          id: 'id',
          trainingStartTime: Duration(),
          trainingTime: Duration(),
          needBook: false,
          needChair: false,
          needTowel: false,
          needDumbbell: false,
          isRestday: true),
      wednesdayVideo: Video(
          id: 'T2lyoAhcnXI',
          trainingStartTime: Duration(minutes: 2),
          trainingTime: Duration(minutes: 30),
          needBook: false,
          needChair: false,
          needTowel: true,
          needDumbbell: false,
          isRestday: false),
      thursdayVideo: Video(
          id: 'id',
          trainingStartTime: Duration(),
          trainingTime: Duration(),
          needBook: false,
          needChair: false,
          needTowel: false,
          needDumbbell: false,
          isRestday: true),
      fridayVideo: Video(
          id: '9PvUWUCMsFI',
          trainingStartTime: Duration(minutes: 2, seconds: 5),
          trainingTime: Duration(minutes: 30),
          needBook: false,
          needChair: false,
          needTowel: false,
          needDumbbell: false,
          isRestday: false),
      saturdayVideo: Video(
          id: 'id',
          trainingStartTime: Duration(),
          trainingTime: Duration(),
          needBook: false,
          needChair: false,
          needTowel: false,
          needDumbbell: false,
          isRestday: true),
      sundayVideo: Video(
          id: 'id',
          trainingStartTime: Duration(),
          trainingTime: Duration(),
          needBook: false,
          needChair: false,
          needTowel: false,
          needDumbbell: false,
          isRestday: true),
    );
  }

  List<TrainingPlan> _generateTrainingPlansList(int length) {
    return [
      const TrainingPlan(
        id: '1',
        name: ' Trainingsplan A (30 Minuten)',
        description: 'Ganzkörper Training mit 30 Minuten Einheiten.',
        mondayVideo: Video(
            id: 'T2lyoAhcnXI',
            trainingStartTime: Duration(minutes: 2),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: true,
            needDumbbell: false,
            isRestday: false),
        tuesdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        wednesdayVideo: Video(
            id: 'T2lyoAhcnXI',
            trainingStartTime: Duration(minutes: 2),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: true,
            needDumbbell: false,
            isRestday: false),
        thursdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        fridayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 5),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        saturdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        sundayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
      ),
      const TrainingPlan(
        id: '2',
        name: ' Trainingsplan A (60 Minuten)',
        description: 'Ganzkörper Training mit 60 Minuten Einheiten.',
        mondayVideo: Video(
            id: 'aDVz9F7azmk',
            trainingStartTime: Duration(minutes: 2, seconds: 9),
            trainingTime: Duration(hours: 1),
            needBook: true,
            needChair: true,
            needTowel: true,
            needDumbbell: false,
            isRestday: false),
        tuesdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        wednesdayVideo: Video(
            id: 'aDVz9F7azmk',
            trainingStartTime: Duration(minutes: 2, seconds: 9),
            trainingTime: Duration(hours: 1),
            needBook: true,
            needChair: true,
            needTowel: true,
            needDumbbell: false,
            isRestday: false),
        thursdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        fridayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 5),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        saturdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        sundayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
      ),
      const TrainingPlan(
        id: '3',
        name: 'Trainingsplan B (30 Minuten)',
        description:
            'Ganzkörper Workout mit einem 30 Minuten Workout am Freitag.',
        mondayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 6),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        tuesdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        wednesdayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 6),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        thursdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        fridayVideo: Video(
            id: 'T2lyoAhcnXI',
            trainingStartTime: Duration(minutes: 2),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: true,
            needDumbbell: false,
            isRestday: false),
        saturdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        sundayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
      ),
      const TrainingPlan(
        id: '4',
        name: 'Trainingsplan B (60 Minuten)',
        description:
            'Ganzkörper Workout mit einem 60 Minuten Workout am Freitag.',
        mondayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 6),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        tuesdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        wednesdayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 6),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        thursdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        fridayVideo: Video(
            id: 'aDVz9F7azmk',
            trainingStartTime: Duration(minutes: 2, seconds: 9),
            trainingTime: Duration(hours: 1),
            needBook: true,
            needChair: true,
            needTowel: true,
            needDumbbell: false,
            isRestday: false),
        saturdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        sundayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
      ),
      const TrainingPlan(
        id: '5',
        name: 'Trainingsplan C',
        description: 'Zunahme und Muskelaufbau.',
        mondayVideo: Video(
            id: 'qGCCVFrsN0Y',
            trainingStartTime: Duration(minutes: 3, seconds: 10),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: true,
            needTowel: true,
            needDumbbell: false,
            isRestday: false),
        tuesdayVideo: Video(
            id: 'bcH-qcnpy20',
            trainingStartTime: Duration(minutes: 2, seconds: 4),
            trainingTime: Duration(minutes: 10),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        wednesdayVideo: Video(
            id: 'qGCCVFrsN0Y',
            trainingStartTime: Duration(minutes: 3, seconds: 10),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: true,
            needTowel: true,
            needDumbbell: false,
            isRestday: false),
        thursdayVideo: Video(
            id: 'bcH-qcnpy20',
            trainingStartTime: Duration(minutes: 2, seconds: 4),
            trainingTime: Duration(minutes: 10),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        fridayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        saturdayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 6),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        sundayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
      ),
      const TrainingPlan(
        id: '6',
        name: 'Trainingsplan D',
        description: 'Abnehmen und Muskelaufbau.',
        mondayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 6),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        tuesdayVideo: Video(
            id: 'qGCCVFrsN0Y',
            trainingStartTime: Duration(minutes: 3, seconds: 10),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: true,
            needTowel: true,
            needDumbbell: false,
            isRestday: false),
        wednesdayVideo: Video(
            id: 'bcH-qcnpy20',
            trainingStartTime: Duration(minutes: 2, seconds: 4),
            trainingTime: Duration(minutes: 10),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        thursdayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
        fridayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 6),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        saturdayVideo: Video(
            id: '9PvUWUCMsFI',
            trainingStartTime: Duration(minutes: 2, seconds: 6),
            trainingTime: Duration(minutes: 30),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: false),
        sundayVideo: Video(
            id: 'id',
            trainingStartTime: Duration(),
            trainingTime: Duration(),
            needBook: false,
            needChair: false,
            needTowel: false,
            needDumbbell: false,
            isRestday: true),
      )
    ];
  }

  List<Item> _generateItemsList(int length) {
    return List.generate(
      length,
      (index) => Item(id: '$index', value: 'Item $index'),
    );
  }

  Future<void> deleteItem(String id) async {
    await Future<void>.delayed(Duration(seconds: _randomRange(1, 5)));
  }
}
