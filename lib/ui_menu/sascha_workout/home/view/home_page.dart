import 'package:fitness_app/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => HomeCubit(repository: Repository())..fetchList(),
        child: HomeView(),
      ),
    );
  }
}
