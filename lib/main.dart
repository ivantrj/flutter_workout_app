import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_app/blocs/cubit/workouts_cubit.dart';
import 'package:flutter_workout_app/models/workout.dart';
import 'package:flutter_workout_app/screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Workouts",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BlocProvider<WorkoutsCubit>(
        create: (BuildContext context) {
          WorkoutsCubit workoutsCubit = WorkoutsCubit();
          if (workoutsCubit.state.isEmpty) {
            print("Loading workouts...");
            workoutsCubit.getWorkouts();
          }
          print('workouts loadded');
          return workoutsCubit;
        },
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(builder: (context, state) {
          return const HomePage();
        }),
      ),
    );
  }
}
