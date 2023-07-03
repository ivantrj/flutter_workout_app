import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_app/blocs/cubit/workout_cubit.dart';
import 'package:flutter_workout_app/helpers.dart';
import 'package:flutter_workout_app/models/exercise.dart';
import 'package:flutter_workout_app/states/workout_states.dart';

class EditWorkoutPage extends StatelessWidget {
  const EditWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: BlocBuilder<WorkoutCubit, WorkoutState>(builder: (context, state) {
        WorkoutEditing we = state as WorkoutEditing;
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => BlocProvider.of<WorkoutCubit>(context).goHome(),
            ),
          ),
          body: ListView.builder(
            itemCount: we.workout!.exercises.length,
            itemBuilder: ((context, index) {
              Exercise exercise = we.workout!.exercises[index];
              return ListTile(
                leading: Text(
                  formatTime(exercise.prelude!, true),
                ),
                trailing: Text(formatTime(exercise.duration!, true)),
                title: Text(exercise.title!),
              );
            }),
          ),
        );
      }),
      onWillPop: () => BlocProvider.of<WorkoutCubit>(context).goHome(),
    );
  }
}
