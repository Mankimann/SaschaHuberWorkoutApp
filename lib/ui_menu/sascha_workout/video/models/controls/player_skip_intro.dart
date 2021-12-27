import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/video/models/video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class PlayerSkipIntro extends StatelessWidget {
  PlayerSkipIntro(this.video);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        YoutubeValueBuilder(
          builder: (context, value) {
            return TextButton(
              child: Container(
                alignment: Alignment.center,
                color: Color.fromRGBO(197, 0, 14, 1),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40,
                child: const AutoSizeText(
                  'Intro überspringen',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              onPressed: () {
                context.ytController.seekTo(
                  video.trainingStartTime,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
