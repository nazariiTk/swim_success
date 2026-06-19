import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/swimmer_level.dart';
import 'pace_state.dart';

class PaceCubit extends Cubit<PaceState> {
  static const int minPaceSeconds = 45; // 0:45
  static const int maxPaceSeconds = 180; // 3:00

  PaceCubit()
      : super(PaceState(
          totalSeconds: 90, // Default to 1:30
          level: SwimmerLevel.fromSeconds(90),
        ));

  void updatePace(int totalSeconds) {
    final clampedSeconds = totalSeconds.clamp(minPaceSeconds, maxPaceSeconds);
    emit(state.copyWith(
      totalSeconds: clampedSeconds,
      level: SwimmerLevel.fromSeconds(clampedSeconds),
      errorMessage: null,
      isSubmitted: false,
    ));
  }

  void incrementMinutes() {
    updatePace(state.totalSeconds + 60);
  }

  void decrementMinutes() {
    updatePace(state.totalSeconds - 60);
  }

  void incrementSeconds() {
    updatePace(state.totalSeconds + 1);
  }

  void decrementSeconds() {
    updatePace(state.totalSeconds - 1);
  }

  void updateMinutes(int minutes) {
    final currentSeconds = state.totalSeconds % 60;
    updatePace(minutes * 60 + currentSeconds);
  }

  void updateSeconds(int seconds) {
    final currentMinutes = state.totalSeconds ~/ 60;
    updatePace(currentMinutes * 60 + seconds);
  }
}
