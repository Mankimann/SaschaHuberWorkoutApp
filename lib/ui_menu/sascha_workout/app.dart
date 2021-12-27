import 'package:fitness_app/home/home.dart';
import 'package:fitness_app/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends MaterialApp {
  App()
      : super(
          theme: ThemeData(
            textTheme: GoogleFonts.robotoCondensedTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (_) => HomeCubit(repository: Repository())..fetchList(),
            child: HomePage(),
          ),
        );
}
