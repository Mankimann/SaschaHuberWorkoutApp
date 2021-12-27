import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sascha_huber_workout_app/ui_window/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]).then((value) => runApp(const WorkoutApp()));

}



