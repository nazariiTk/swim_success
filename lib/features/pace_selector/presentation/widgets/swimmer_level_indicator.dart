import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/pace_cubit.dart';
import '../cubit/pace_state.dart';
import '../../domain/entities/swimmer_level.dart';

class SwimmerLevelIndicator extends StatelessWidget {
  const SwimmerLevelIndicator({super.key});

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
    return BlocBuilder<PaceCubit, PaceState>(
      buildWhen: (prev, curr) => prev.level != curr.level,
      builder: (context, state) {
        final levelColor = _getLevelColor(state.level);

        return Center(
          child: Column(
            children: [
              const Text(
                'THAT PUTS YOU AT',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF475569),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(end: levelColor),
                duration: const Duration(milliseconds: 300),
                builder: (context, color, child) {
                  final effectiveColor = color ?? levelColor;
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.0, 0.2),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      state.level.name,
                      key: ValueKey<String>(state.level.name),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: effectiveColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
