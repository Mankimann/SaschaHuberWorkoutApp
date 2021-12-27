import 'package:fitness_app/video/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoCubit extends Cubit<Video> {
  VideoCubit(this.video) : super(video);

  final Video video;

  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;
}
