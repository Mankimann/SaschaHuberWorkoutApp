import 'package:fitness_app/training_plan_choosen/cubit/training_plan_choosen_cubit.dart';
import 'package:fitness_app/training_plan_choosen/view/training_plan_choosen_view.dart';
import 'package:fitness_app/training_plans_overview/models/training_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingPlanChoosenPage extends StatelessWidget {
  TrainingPlanChoosenPage(this.trainingPlan);

  final TrainingPlan trainingPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => TrainingPlanChoosenCubit(trainingPlan: trainingPlan),
        child: TrainingPlanChoosenView(),
      ),
    );
  }
}
