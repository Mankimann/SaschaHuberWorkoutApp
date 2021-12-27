import 'package:fitness_app/training_plans_overview/cubit/training_plans_overview_cubit.dart';
import 'package:fitness_app/training_plans_overview/view/training_plans_overview_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository.dart';

class TrainingPlansOverviewPage extends StatelessWidget {
  TrainingPlansOverviewPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            TrainingPlansOverviewCubit(repository: Repository())..fetchList(),
        child: TrainingPlansOverviewView(),
      ),
    );
  }
}
