part of 'home_cubit.dart';

enum HomeStatus { loading, success, failure }

class HomeState extends Equatable {
  const HomeState._({
    this.status = HomeStatus.loading,
    this.items = const TrainingPlan(),
  });

  const HomeState.loading() : this._();

  const HomeState.success(TrainingPlan items)
      : this._(status: HomeStatus.success, items: items);

  const HomeState.failure() : this._(status: HomeStatus.failure);

  final HomeStatus status;
  final TrainingPlan items;

  @override
  List<Object> get props => [status, items];
}
