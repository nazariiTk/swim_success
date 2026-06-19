import 'package:flutter/material.dart';

class SliderLabels extends StatelessWidget {
  final double min;
  final double max;
  final List<double> values;
  final List<String> labelTexts;

  const SliderLabels({
    super.key,
    required this.min,
    required this.max,
    required this.values,
    required this.labelTexts,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        // Standard Material Slider track padding
        const double trackPadding = 24.0;
        final double trackWidth = width - (trackPadding * 2);

        return SizedBox(
          height: 20,
          width: width,
          child: Stack(
            children: List.generate(values.length, (index) {
              final double value = values[index];
              final String text = labelTexts[index];

              final double fraction = (value - min) / (max - min);
              final double labelCenter = trackPadding + (fraction * trackWidth);

              return Positioned(
                left: labelCenter,
                top: 0,
                child: FractionalTranslation(
                  translation: const Offset(-0.5, 0.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
