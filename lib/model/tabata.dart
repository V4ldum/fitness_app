import 'package:fitness_app/model/exercise.dart';
import 'package:fitness_app/utils/duration_to_string.dart';

import 'bloc.dart';

class Tabata extends Bloc {
  late Duration work;
  late Duration pause;

  Tabata({
    sets = 1,
    int workMinutes = 0,
    int workSeconds = 0,
    int restSeconds = 0,
    int restMinutes = 0,
    int pauseMinutes = 0,
    int pauseSeconds = 0,
    List<Exercise> exercises = const [],
  })  : assert(sets > 0),
        assert(workMinutes >= 0 && workMinutes < 60),
        assert(workSeconds >= 0 && workSeconds < 60),
        assert(restSeconds >= 0 && restSeconds < 60),
        assert(restMinutes >= 0 && restMinutes < 60),
        assert(pauseMinutes >= 0 && pauseMinutes < 60),
        assert(pauseSeconds >= 0 && pauseSeconds < 60),
        super(
          sets: sets,
          restSeconds: restSeconds,
          restMinutes: restMinutes,
          exercises: exercises,
        ) {
    work = Duration(seconds: workSeconds, minutes: workMinutes);
    pause = Duration(seconds: pauseSeconds, minutes: pauseMinutes);
  }

  factory Tabata.fromJson(Map<String, dynamic> json) {
    List jsonExercises = json["exercises"];
    List<Exercise> exercises = [];

    for (var element in jsonExercises) {
      exercises.add(Exercise.fromJson(element));
    }

    return Tabata(
      sets: json["details"]["sets"] ?? 1,
      workMinutes: json["details"]["work_duration"]["min"] ?? 0,
      workSeconds: json["details"]["work_duration"]["sec"] ?? 0,
      restSeconds: json["details"]["rest_duration"]["sec"] ?? 0,
      restMinutes: json["details"]["rest_duration"]["min"] ?? 0,
      pauseMinutes: json["details"]["break_duration"]["min"] ?? 0,
      pauseSeconds: json["details"]["break_duration"]["sec"] ?? 0,
      exercises: exercises,
    );
  }

  @override
  String toString() {
    StringBuffer out = StringBuffer();

    // Number of cycles
    out.write("$sets Cycles [ ");

    // Tabata information (work, rest)
    out.write(Converter.durationToString(work));
    out.write(" Work - ");
    out.write(Converter.durationToString(rest));
    out.write(" Rest ] - ");

    // Break duration between cycles
    out.write(Converter.durationToString(pause));
    out.write(" Pause");

    return "$out";
  }
}
