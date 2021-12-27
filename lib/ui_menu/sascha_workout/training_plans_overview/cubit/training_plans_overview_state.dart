part of 'training_plans_overview_cubit.dart';

enum TrainingPlansOverviewStatus { loading, success, failure }

class TrainingPlansOverviewState extends Equatable {
  const TrainingPlansOverviewState._({
    this.status = TrainingPlansOverviewStatus.loading,
    this.items = const <TrainingPlan>[],
  });

  const TrainingPlansOverviewState.loading() : this._();

  const TrainingPlansOverviewState.success(List<TrainingPlan> items)
      : this._(status: TrainingPlansOverviewStatus.success, items: items);

  const TrainingPlansOverviewState.failure()
      : this._(status: TrainingPlansOverviewStatus.failure);

  final TrainingPlansOverviewStatus status;
  final List<TrainingPlan> items;

  @override
  List<Object> get props => [status, items];
}
