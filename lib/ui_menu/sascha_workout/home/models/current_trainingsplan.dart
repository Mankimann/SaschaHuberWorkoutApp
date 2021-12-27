import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class CurrentTrainingPlan extends Equatable {
  const CurrentTrainingPlan({
    @required this.trainingPlan,
  });

  final TrainingPlan trainingPlan;

  CurrentTrainingPlan copyWith({
    TrainingPlan trainingPlan,
  }) {
    return CurrentTrainingPlan(
      trainingPlan: trainingPlan ?? this.trainingPlan,
    );
  }

  @override
  List<Object> get props => [trainingPlan];
}
