import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:meta/meta.dart';
import '../../repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({@required this.repository}) : super(const HomeState.loading());

  final Repository repository;

  Future<void> fetchList() async {
    try {
      final items = await repository.fetchCurrentTrainingPlan();
      emit(HomeState.success(items));
    } on Exception {
      emit(const HomeState.failure());
    }
  }
}
