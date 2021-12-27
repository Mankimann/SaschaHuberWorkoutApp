import 'package:fitness_app/video/models/controls/player_skip_intro.dart';
import 'package:fitness_app/video/models/video.dart';
import 'package:flutter/material.dart';

class Controls extends StatelessWidget {
  Controls(this.video);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _space,
          PlayerSkipIntro(video),
          //_space,
          //MetaDataSection(),
          // _space,
          // SourceInputSection(),
          // _space,
          //PlayPauseButtonBar(),
          //_space,
          //VolumeSlider(),
          // _space,
          // PlayerStateSection(),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}
