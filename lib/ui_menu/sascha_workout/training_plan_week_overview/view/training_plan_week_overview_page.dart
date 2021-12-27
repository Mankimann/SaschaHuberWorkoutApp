import 'package:fitness_app/training_plan_week_overview/cubit/training_plan_week_overview_cubit.dart';
import 'package:fitness_app/training_plan_week_overview/view/training_plan_week_overview_view.dart';
import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:fitness_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingPlanWeekOverviewPage extends StatelessWidget {
  TrainingPlanWeekOverviewPage(this._trainingPlan);

  final TrainingPlan _trainingPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarGlobal.buildAppBar(context, _trainingPlan.name),
      ),
      body: BlocProvider(
        create: (_) =>
            TrainingPlanWeekOverviewCubit(trainingPlan: _trainingPlan)
              ..fetchList(),
        child: TrainingPlanWeekOverviewView(),
      ),
    );
  }
}
