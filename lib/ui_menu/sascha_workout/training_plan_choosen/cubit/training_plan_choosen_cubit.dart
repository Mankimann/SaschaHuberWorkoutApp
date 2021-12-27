import 'package:bloc/bloc.dart';
import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:meta/meta.dart';

class TrainingPlanChoosenCubit extends Cubit<TrainingPlan> {
  TrainingPlanChoosenCubit({@required this.trainingPlan}) : super(trainingPlan);

  final TrainingPlan trainingPlan;
}
