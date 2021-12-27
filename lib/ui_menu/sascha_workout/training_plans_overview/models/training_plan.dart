import 'package:fitness_app/video/models/video.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class TrainingPlan extends Equatable {
  const TrainingPlan({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.mondayVideo,
    @required this.tuesdayVideo,
    @required this.wednesdayVideo,
    @required this.thursdayVideo,
    @required this.fridayVideo,
    @required this.saturdayVideo,
    @required this.sundayVideo,
  });

  final String id;
  final String name;
  final String description;
  final Video mondayVideo;
  final Video tuesdayVideo;
  final Video wednesdayVideo;
  final Video thursdayVideo;
  final Video fridayVideo;
  final Video saturdayVideo;
  final Video sundayVideo;

  TrainingPlan copyWith({
    String id,
    String name,
    String description,
    Video mondayVideo,
    Video tuesdayVideo,
    Video wednesdayVideo,
    Video thursdayVideo,
    Video fridayVideo,
    Video saturdayVideo,
    Video sundayVideo,
  }) {
    return TrainingPlan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      mondayVideo: mondayVideo ?? this.mondayVideo,
      tuesdayVideo: tuesdayVideo ?? this.tuesdayVideo,
      wednesdayVideo: wednesdayVideo ?? this.wednesdayVideo,
      thursdayVideo: thursdayVideo ?? this.thursdayVideo,
      fridayVideo: fridayVideo ?? this.fridayVideo,
      saturdayVideo: saturdayVideo ?? this.saturdayVideo,
      sundayVideo: sundayVideo ?? this.sundayVideo,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        mondayVideo,
        tuesdayVideo,
        wednesdayVideo,
        thursdayVideo,
        fridayVideo,
        saturdayVideo,
        sundayVideo
      ];
}
