import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../domain/entities/swimmer_level.dart';
import '../cubit/pace_cubit.dart';
import '../cubit/pace_state.dart';
import '../widgets/glowing_slider_thumb.dart';
import '../widgets/segmented_slider_track.dart';
import '../widgets/slider_labels.dart';
import '../widgets/pace_selector_timer.dart';
import '../widgets/swimmer_level_indicator.dart';
import '../widgets/swimmer_levels_row.dart';

class PaceSelectorPage extends StatelessWidget {
  const PaceSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PaceCubit>(),
      child: const PaceSelectorView(),
    );
  }
}

class PaceSelectorView extends StatelessWidget {
  const PaceSelectorView({super.key});

  Color _getLevelColor(SwimmerLevel level) {
    switch (level) {
      case SwimmerLevel.elite:
        return const Color(0xFFEAB308); // Orange-Gold
      case SwimmerLevel.advanced:
        return const Color(0xFF0EA5E9); // Light Blue
      case SwimmerLevel.intermediate:
        return const Color(0xFF14B8A6); // Turquoise
      case SwimmerLevel.beginner:
        return const Color(0xFF94A3B8); // Grey
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pace Selector')),
      body: BlocListener<PaceCubit, PaceState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.isSubmitted != current.isSubmitted ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
          if (state.isSubmitted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Pace submitted successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: BlocBuilder<PaceCubit, PaceState>(
          builder: (context, state) {
            final levelColor = _getLevelColor(state.level);

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const Text(
                    "What's your fastest\n100m freestyle?",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This helps us build a more accurate plan for you.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Timer Display
                  PaceSelectorTimer(levelColor: levelColor),

                  const SizedBox(height: 32),

                  // Swimmer Level Display
                  const SwimmerLevelIndicator(),

                  const SizedBox(height: 24),

                  // Swimmer Levels Row (fastest to slowest)
                  const SwimmerLevelsRow(),

                  const SizedBox(height: 24),

                  // Custom Segmented Slider
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackShape: SegmentedSliderTrackShape(
                        currentLevel: state.level,
                        eliteColor: _getLevelColor(SwimmerLevel.elite),
                        advancedColor: _getLevelColor(SwimmerLevel.advanced),
                        intermediateColor: _getLevelColor(SwimmerLevel.intermediate),
                        beginnerColor: _getLevelColor(SwimmerLevel.beginner),
                        defaultTrackColor: const Color(0xFF1E293B), // Dark grey
                      ),
                      activeTrackColor: Colors.transparent,
                      inactiveTrackColor: Colors.transparent,
                      thumbColor: Colors.white,
                      overlayColor: levelColor.withAlpha(30),
                      valueIndicatorColor: levelColor,
                      trackHeight: 3.0,
                      thumbShape: GlowingSliderThumbShape(
                        thumbRadius: 10.0,
                        thumbColor: Colors.white,
                        shadowColor: levelColor,
                        blurRadius: 6.0,
                      ),
                      overlayShape: SliderComponentShape.noOverlay,
                    ),
                    child: Slider(
                      min: PaceCubit.minPaceSeconds.toDouble(),
                      max: PaceCubit.maxPaceSeconds.toDouble(),
                      value: state.totalSeconds.toDouble(),
                      onChanged: (val) {
                        context.read<PaceCubit>().updatePace(val.toInt());
                      },
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Slider labels
                  SliderLabels(
                    min: PaceCubit.minPaceSeconds.toDouble(),
                    max: PaceCubit.maxPaceSeconds.toDouble(),
                    values: const [45.0, 70.0, 90.0, 120.0, 180.0, 240.0],
                    labelTexts: const ['0:45', '1:10', '1:30', '2:00', '3:00', '4:00'],
                  ),

                  const SizedBox(height: 40),

                  // Animated Continue Button
                  TweenAnimationBuilder<Color?>(
                    tween: ColorTween(end: levelColor),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, color, child) {
                      final effectiveColor = color ?? levelColor;
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: effectiveColor.withValues(alpha: 0.35),
                              blurRadius: 16.0,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: state.isLoading
                                ? null
                                : () {
                                    context.read<PaceCubit>().submitPace();
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: effectiveColor,
                              foregroundColor: state.level == SwimmerLevel.beginner
                                  ? Colors.black
                                  : Colors.white,
                              disabledBackgroundColor: effectiveColor.withValues(alpha: 0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: state.isLoading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        state.level == SwimmerLevel.beginner
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Continue',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_forward, size: 18),
                                    ],
                                  ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Skip Button
                  Center(
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Skipped pace selection')),
                        );
                      },
                      child: const Text(
                        "I don't know my pace, skip this",
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          decoration: TextDecoration.underline,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
