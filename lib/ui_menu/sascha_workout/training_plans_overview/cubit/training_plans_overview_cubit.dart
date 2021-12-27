import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../repository.dart';
import '../training_plans_overview.dart';

part 'training_plans_overview_state.dart';

class TrainingPlansOverviewCubit extends Cubit<TrainingPlansOverviewState> {
  TrainingPlansOverviewCubit({@required this.repository})
      : super(const TrainingPlansOverviewState.loading());

  final Repository repository;

  Future<void> fetchList() async {
    try {
      final items = await repository.fetchTrainingPlans();
      emit(TrainingPlansOverviewState.success(items));
    } on Exception {
      emit(const TrainingPlansOverviewState.failure());
    }
  }
}
