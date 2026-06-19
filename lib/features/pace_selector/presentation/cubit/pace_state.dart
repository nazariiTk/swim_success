import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/swimmer_level.dart';

part 'pace_state.freezed.dart';

@freezed
class PaceState with _$PaceState {
  const factory PaceState({
    required int totalSeconds,
    required SwimmerLevel level,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isSubmitted,
  }) = _PaceState;
}
