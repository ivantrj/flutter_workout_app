import 'package:equatable/equatable.dart';
import 'package:flutter_workout_app/models/workout.dart';

abstract class WorkoutState extends Equatable {
  final Workout? workout;
  final int? elapsed;

  WorkoutState(this.workout, this.elapsed);
}

class WorkoutInitial extends WorkoutState {
  WorkoutInitial() : super(null, 0);

  @override
  List<Object?> get props => [];
}

class WorkoutEditing extends WorkoutState {
  final int index;
  final int? exIndex;

  WorkoutEditing(Workout? workout, this.index, this.exIndex) : super(workout, 0);

  @override
  List<Object?> get props => [workout, index, exIndex];
}
