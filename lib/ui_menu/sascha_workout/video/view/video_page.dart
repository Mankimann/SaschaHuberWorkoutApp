import 'package:fitness_app/video/cubit/video_cubit.dart';
import 'package:fitness_app/video/models/video.dart';
import 'package:fitness_app/video/view/view.dart';
import 'package:fitness_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPage extends StatelessWidget {
  VideoPage(this.video);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarGlobal.buildAppBar(context, 'Workout'),
      ),
      body: BlocProvider(
        create: (_) => VideoCubit(video),
        child: VideoView(),
      ),
    );
  }
}
