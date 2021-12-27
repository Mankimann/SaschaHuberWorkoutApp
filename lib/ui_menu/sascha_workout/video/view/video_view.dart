import 'package:fitness_app/video/cubit/video_cubit.dart';
import 'package:fitness_app/video/models/models.dart';
import 'package:fitness_app/video/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, Video>(builder: (context, video) {
      return Container(
        color: Colors.black87,
        child: VideoPlayer(
          video,
        ),
      );
    });
  }
}
