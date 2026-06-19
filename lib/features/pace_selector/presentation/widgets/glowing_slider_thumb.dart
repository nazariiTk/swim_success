import 'package:flutter/material.dart';

class GlowingSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final Color thumbColor;
  final Color shadowColor;
  final double blurRadius;

  const GlowingSliderThumbShape({
    this.thumbRadius = 12.0,
    this.thumbColor = Colors.white,
    this.shadowColor = Colors.blueAccent,
    this.blurRadius = 8.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // 1. Draw shadow (diffused glow)
    // Use activation animation so the shadow gets slightly larger when touched
    final double currentBlur = blurRadius + (activationAnimation.value * 4);
    
    final Paint shadowPaint = Paint()
      ..color = shadowColor.withValues(alpha: 0.4) // Transparency of the shadow
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, currentBlur);

    // Draw the shadow circle slightly larger than the thumb itself
    canvas.drawCircle(center, thumbRadius + 2, shadowPaint);

    // 2. Draw the thumb itself (solid circle on top of the shadow)
    final Paint thumbPaint = Paint()..color = thumbColor;
    canvas.drawCircle(center, thumbRadius, thumbPaint);

    // 3. Draw a subtle border
    final Paint borderPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
