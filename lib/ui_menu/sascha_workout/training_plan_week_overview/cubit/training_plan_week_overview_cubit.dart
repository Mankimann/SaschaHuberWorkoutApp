import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:meta/meta.dart';

part 'training_plan_week_overview_state.dart';

class TrainingPlanWeekOverviewCubit
    extends Cubit<TrainingPlanWeekOverviewState> {
  TrainingPlanWeekOverviewCubit({@required this.trainingPlan})
      : super(const TrainingPlanWeekOverviewState.loading());

  final TrainingPlan trainingPlan;

  Future<void> fetchList() async {
    try {
      emit(TrainingPlanWeekOverviewState.success(trainingPlan));
    } on Exception {
      emit(const TrainingPlanWeekOverviewState.failure());
    }
  }
}
