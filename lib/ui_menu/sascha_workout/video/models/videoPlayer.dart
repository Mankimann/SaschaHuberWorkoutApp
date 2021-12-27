import 'dart:convert';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/video/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

import 'controls/player_skip_intro.dart';
import 'package:http/http.dart' as http;

class VideoPlayer extends StatefulWidget {
  VideoPlayer(this.video);

  final Video video;

  @override
  _VideoPlayerState createState() => _VideoPlayerState(video);
}

class _VideoPlayerState extends State<VideoPlayer> {
  _VideoPlayerState(this.video) {
    getYoutubeDescription(video.id).then((val) => setState(() {
          _videoDescription = val;
        }));
  }

  final Video video;

  YoutubePlayerController _controller;
  var _videoDescription = '';

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: video.id,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        desktopMode: true,
        autoPlay: true,
        interfaceLanguage: 'de',
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 5), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
      log('Exited Fullscreen');
    };
  }

  Future<String> getYoutubeDescription(String videoId) async {
    var url =
        'https://www.googleapis.com/youtube/v3/videos?part=snippet&id=$videoId&key=AIzaSyAOqbZkIy1izK2J6YCEZF-M-v3vGtzqdec&fields=items(snippet(description))';
    print(url);
    final response = await http.get(url);
    var fileContent = await jsonDecode(response.body);
    return fileContent
        .toString()
        .replaceAll('{items: [{snippet: {description:', '');
  }

  @override
  Widget build(BuildContext context) {
    getYoutubeDescription(video.id);
    const equidmentWidth = 70.0;
    const equidmentHeight = 70.0;
    const player = YoutubePlayerIFrame();
    print(_videoDescription);
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          player,
                          PlayerSkipIntro(video),
                          Container(
                            child: DefaultTabController(
                              length: 2, // length of tabs
                              initialIndex: 0,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    child: const TabBar(
                                      indicatorColor:
                                          Color.fromRGBO(197, 0, 14, 1),
                                      labelColor: Color.fromRGBO(197, 0, 14, 1),
                                      unselectedLabelColor: Colors.white,
                                      tabs: [
                                        Tab(text: 'Vorbereitung'),
                                        Tab(text: 'Beschreibung'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 400,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey,
                                                width: 0.5))),
                                    child: TabBarView(
                                      children: <Widget>[
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const AutoSizeText(
                                                'Dieses Equidment benötigst Du für das Training:',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              video.needBook == true
                                                  ? Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 5, 20, 5),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/equidment/buch.png',
                                                            width:
                                                                equidmentWidth,
                                                            height:
                                                                equidmentHeight,
                                                          ),
                                                          const SizedBox(
                                                            width: 30,
                                                          ),
                                                          const AutoSizeText(
                                                            'Buch',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                              video.needTowel == true
                                                  ? Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 5, 20, 5),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/equidment/handtuch.png',
                                                            width:
                                                                equidmentWidth,
                                                            height:
                                                                equidmentHeight,
                                                          ),
                                                          const SizedBox(
                                                            width: 30,
                                                          ),
                                                          const AutoSizeText(
                                                            'Handtuch',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                              video.needDumbbell == true
                                                  ? Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 5, 20, 5),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/equidment/hantel.png',
                                                            width:
                                                                equidmentWidth,
                                                            height:
                                                                equidmentHeight,
                                                          ),
                                                          const SizedBox(
                                                            width: 30,
                                                          ),
                                                          const AutoSizeText(
                                                            'Hantel',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                              video.needChair == true
                                                  ? Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 5, 20, 5),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            'assets/equidment/stuhl.png',
                                                            width:
                                                                equidmentWidth,
                                                            height:
                                                                equidmentHeight,
                                                          ),
                                                          const SizedBox(
                                                            width: 30,
                                                          ),
                                                          const AutoSizeText(
                                                            'Stuhl',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: _videoDescription,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
