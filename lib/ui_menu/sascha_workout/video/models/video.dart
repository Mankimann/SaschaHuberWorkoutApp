import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Video extends Equatable {
  const Video({
    @required this.id,
    @required this.trainingStartTime,
    @required this.trainingTime,
    @required this.needBook,
    @required this.needChair,
    @required this.needTowel,
    @required this.needDumbbell,
    @required this.isRestday,
  });

  final String id;
  final Duration trainingStartTime;
  final Duration trainingTime;
  final bool needBook;
  final bool needChair;
  final bool needTowel;
  final bool needDumbbell;
  final bool isRestday;

  Video copyWith({
    String id,
    Duration trainingStartTime,
    Duration trainingTime,
    bool needBook,
    bool needChair,
    bool needTowel,
    bool needDumbbell,
    bool isRestday,
  }) {
    return Video(
      id: id ?? this.id,
      trainingStartTime: trainingStartTime ?? this.trainingStartTime,
      trainingTime: trainingStartTime ?? this.trainingTime,
      needBook: needBook ?? this.needBook,
      needChair: needChair ?? this.needChair,
      needTowel: needTowel ?? this.needTowel,
      needDumbbell: needDumbbell ?? this.needDumbbell,
      isRestday: isRestday ?? this.isRestday,
    );
  }

  @override
  List<Object> get props => [
        id,
        trainingStartTime,
        trainingTime,
        needBook,
        needChair,
        needTowel,
        needDumbbell,
        isRestday,
      ];
}
