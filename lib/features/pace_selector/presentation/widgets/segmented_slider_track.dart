import 'package:flutter/material.dart';
import '../../domain/entities/swimmer_level.dart';
import '../cubit/pace_cubit.dart';

class SegmentedSliderTrackShape extends SliderTrackShape {
  final SwimmerLevel currentLevel;
  final Color eliteColor;
  final Color advancedColor;
  final Color intermediateColor;
  final Color beginnerColor;
  final Color defaultTrackColor;

  SegmentedSliderTrackShape({
    required this.currentLevel,
    required this.eliteColor,
    required this.advancedColor,
    required this.intermediateColor,
    required this.beginnerColor,
    required this.defaultTrackColor,
  });

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 4.0;
    const double margin = 24.0;
    final double trackLeft = offset.dx + margin;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 2 * margin;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Offset thumbCenter,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    Offset? secondaryOffset,
    required TextDirection textDirection,
  }) {
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Paint paint = Paint()..style = PaintingStyle.fill;

    final double minVal = PaceCubit.minPaceSeconds.toDouble();
    final double maxVal = PaceCubit.maxPaceSeconds.toDouble();
    final double totalRange = maxVal - minVal;

    double getXForValue(double val) {
      final double fraction = (val - minVal) / totalRange;
      return trackRect.left + fraction * trackRect.width;
    }

    final segments = [
      _SegmentData(
        minVal,
        SwimmerLevel.eliteThreshold - 0.5,
        SwimmerLevel.elite,
        eliteColor,
      ),
      _SegmentData(
        SwimmerLevel.eliteThreshold - 0.5,
        SwimmerLevel.advancedThreshold - 0.5,
        SwimmerLevel.advanced,
        advancedColor,
      ),
      _SegmentData(
        SwimmerLevel.advancedThreshold - 0.5,
        SwimmerLevel.intermediateThreshold - 0.5,
        SwimmerLevel.intermediate,
        intermediateColor,
      ),
      _SegmentData(
        SwimmerLevel.intermediateThreshold - 0.5,
        maxVal,
        SwimmerLevel.beginner,
        beginnerColor,
      ),
    ];

    for (final seg in segments) {
      final double leftX = getXForValue(seg.start);
      final double rightX = getXForValue(seg.end);

      final Color color =
          (currentLevel == seg.level) ? seg.color : defaultTrackColor;
      paint.color = color;

      final Rect segRect =
          Rect.fromLTRB(leftX, trackRect.top, rightX, trackRect.bottom);

      if (seg.start == minVal) {
        context.canvas.drawRRect(
          RRect.fromRectAndCorners(
            segRect,
            topLeft: const Radius.circular(1.5),
            bottomLeft: const Radius.circular(1.5),
          ),
          paint,
        );
      } else if (seg.end == maxVal) {
        context.canvas.drawRRect(
          RRect.fromRectAndCorners(
            segRect,
            topRight: const Radius.circular(1.5),
            bottomRight: const Radius.circular(1.5),
          ),
          paint,
        );
      } else {
        context.canvas.drawRect(segRect, paint);
      }
    }
  }
}

class _SegmentData {
  final double start;
  final double end;
  final SwimmerLevel level;
  final Color color;
  _SegmentData(this.start, this.end, this.level, this.color);
}
