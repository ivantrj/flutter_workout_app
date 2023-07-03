import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_app/blocs/cubit/workouts_cubit.dart';
import 'package:flutter_workout_app/helpers.dart';
import 'package:flutter_workout_app/models/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Workouts"),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.event_available)),
          IconButton(onPressed: null, icon: Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
          builder: (context, workouts) {
            return ExpansionPanelList.radio(
              children: workouts
                  .map(
                    (workout) => ExpansionPanelRadio(
                      value: workout,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          visualDensity: const VisualDensity(
                            horizontal: 0,
                            vertical: VisualDensity.maximumDensity,
                          ),
                          leading: const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.edit),
                          ),
                          title: Text(workout.title!),
                          trailing: Text(formatTime(workout.getTotal(), true)),
                        );
                      },
                      body: ListView.builder(
                        shrinkWrap: true,
                        itemCount: workout.exercises.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: null,
                            leading: Text(formatTime(workout.exercises[index].prelude!, true)),
                            trailing: Text(formatTime(workout.exercises[index].duration!, true)),
                            title: Text(workout.exercises[index].title!),
                            visualDensity: const VisualDensity(
                              horizontal: 0,
                              vertical: VisualDensity.maximumDensity,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                  .toList(),
            );
            // return Center(child: Text("No data yet!"));
          },
        ),
      ),
    );
  }
}
