// import 'dart:convert';

// Exercise exerciseFromJson(String str) => Exercise.fromJson(json.decode(str));

// String exerciseToJson(Exercise data) => json.encode(data.toJson());

import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  final String? title;
  final int? prelude;
  final int? duration;
  final int? index;
  final int? startTime;

  const Exercise({
    required this.title,
    required this.prelude,
    required this.duration,
    this.index,
    this.startTime,
  });

  factory Exercise.fromJson(Map<String, dynamic> json, int index, int startTime) => Exercise(
        title: json["title"],
        prelude: json["prelude"],
        duration: json["duration"],
        index: index,
        startTime: startTime,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "prelude": prelude,
        "duration": duration,
      };

  @override
  List<Object?> get props => [title, prelude, duration, index, startTime];

  @override
  bool get stringify => true;
}
