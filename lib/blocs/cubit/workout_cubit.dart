import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_app/models/workout.dart';
import 'package:flutter_workout_app/states/workout_states.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(WorkoutInitial());

  editWorkout(Workout workout, int index) {
    return emit(WorkoutEditing(workout, index));
  }
}
