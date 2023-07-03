import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_app/blocs/cubit/workout_cubit.dart';
import 'package:flutter_workout_app/blocs/cubit/workouts_cubit.dart';
import 'package:flutter_workout_app/models/workout.dart';
import 'package:flutter_workout_app/screens/home_page.dart';
import 'package:flutter_workout_app/states/workout_states.dart';

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
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WorkoutsCubit>(
            create: (BuildContext context) {
              WorkoutsCubit workoutsCubit = WorkoutsCubit();
              if (workoutsCubit.state.isEmpty) {
                workoutsCubit.getWorkouts();
              }
              return workoutsCubit;
            },
            child: null,
          ),
          BlocProvider<WorkoutCubit>(
            create: (context) => WorkoutCubit(),
          ),
        ],
        child: BlocBuilder<WorkoutCubit, WorkoutState>(builder: (context, state) {
          if (state is WorkoutInitial) {
            return const HomePage();
          } else if (state is WorkoutEditing) {
            return Container();
          }
          return Container();
        }),
      ),
    );
  }
}
