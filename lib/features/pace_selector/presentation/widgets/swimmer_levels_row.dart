import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/pace_cubit.dart';
import '../cubit/pace_state.dart';
import '../../domain/entities/swimmer_level.dart';

class SwimmerLevelsRow extends StatelessWidget {
  const SwimmerLevelsRow({super.key});

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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: SwimmerLevel.values.reversed.map((level) {
            final isActive = state.level == level;
            final targetColor = _getLevelColor(level);

            return TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                end: isActive ? targetColor : const Color(0xFF475569),
              ),
              duration: const Duration(milliseconds: 300),
              builder: (context, color, child) {
                return Text(
                  level.name,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: color,
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
