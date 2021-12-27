part of 'training_plan_week_overview_cubit.dart';

enum TrainingPlanWeekOverviewStatus { loading, success, failure }

class TrainingPlanWeekOverviewState extends Equatable {
  const TrainingPlanWeekOverviewState._({
    this.status = TrainingPlanWeekOverviewStatus.loading,
    this.items = const TrainingPlan(),
  });

  const TrainingPlanWeekOverviewState.loading() : this._();

  const TrainingPlanWeekOverviewState.success(TrainingPlan items)
      : this._(status: TrainingPlanWeekOverviewStatus.success, items: items);

  const TrainingPlanWeekOverviewState.failure()
      : this._(status: TrainingPlanWeekOverviewStatus.failure);

  final TrainingPlanWeekOverviewStatus status;
  final TrainingPlan items;

  @override
  List<Object> get props => [status, items];
}
