import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/pace_cubit.dart';
import '../cubit/pace_state.dart';

class PaceSelectorTimer extends StatefulWidget {
  final Color levelColor;

  const PaceSelectorTimer({
    super.key,
    required this.levelColor,
  });

  @override
  State<PaceSelectorTimer> createState() => _PaceSelectorTimerState();
}

class _PaceSelectorTimerState extends State<PaceSelectorTimer> {
  late TextEditingController _minController;
  late TextEditingController _secController;
  late FocusNode _minFocusNode;
  late FocusNode _secFocusNode;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<PaceCubit>();
    final initialMin = cubit.state.totalSeconds ~/ 60;
    final initialSec = cubit.state.totalSeconds % 60;

    _minController = TextEditingController(text: initialMin.toString());
    _secController = TextEditingController(
      text: initialSec.toString().padLeft(2, '0'),
    );
    _minFocusNode = FocusNode();
    _secFocusNode = FocusNode();

    _secFocusNode.addListener(_onSecFocusChange);
  }

  void _onSecFocusChange() {
    if (!_secFocusNode.hasFocus) {
      final sec = int.tryParse(_secController.text) ?? 0;
      _secController.text = sec.toString().padLeft(2, '0');
    }
  }

  @override
  void dispose() {
    _minController.dispose();
    _secController.dispose();
    _secFocusNode.removeListener(_onSecFocusChange);
    _minFocusNode.dispose();
    _secFocusNode.dispose();
    super.dispose();
  }

  void _updateFromMinString(String val) {
    final min = int.tryParse(val) ?? 0;
    context.read<PaceCubit>().updateMinutes(min);
  }

  void _updateFromSecString(String val) {
    final sec = int.tryParse(val) ?? 0;
    if (sec > 59) {
      _secController.text = '59';
      _secController.selection = TextSelection.fromPosition(
        const TextSelection.collapsed(offset: 2).base,
      );
      context.read<PaceCubit>().updateSeconds(59);
    } else {
      context.read<PaceCubit>().updateSeconds(sec);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final shadowColor = textColor.withValues(alpha: 0.25);

    return BlocListener<PaceCubit, PaceState>(
      listenWhen: (previous, current) => previous.totalSeconds != current.totalSeconds,
      listener: (context, state) {
        final minutes = state.totalSeconds ~/ 60;
        final seconds = state.totalSeconds % 60;

        if (!_minFocusNode.hasFocus && int.tryParse(_minController.text) != minutes) {
          _minController.text = minutes.toString();
        }
        if (!_secFocusNode.hasFocus && int.tryParse(_secController.text) != seconds) {
          _secController.text = seconds.toString().padLeft(2, '0');
        }
      },
      child: Center(
        child: Column(
          children: [
            const Text(
              'YOUR PACE',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF475569),
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Minutes
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_up, size: 36),
                      onPressed: () {
                        context.read<PaceCubit>().incrementMinutes();
                      },
                    ),
                    SizedBox(
                      width: 80,
                      child: TextField(
                        controller: _minController,
                        focusNode: _minFocusNode,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        onChanged: _updateFromMinString,
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                          shadows: [
                            Shadow(
                              color: shadowColor,
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: false,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const Text(
                      'TAP TO EDIT',
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xFF475569),
                        letterSpacing: 1,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 36,
                      ),
                      onPressed: () {
                        context.read<PaceCubit>().decrementMinutes();
                      },
                    ),
                  ],
                ),

                // Animated Colon
                TweenAnimationBuilder<Color?>(
                  tween: ColorTween(end: widget.levelColor),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, color, child) {
                    final effectiveColor = color ?? widget.levelColor;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        ':',
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: effectiveColor,
                          shadows: [
                            Shadow(
                              color: effectiveColor.withValues(alpha: 0.3),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // Seconds
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_up, size: 36),
                      onPressed: () {
                        context.read<PaceCubit>().incrementSeconds();
                      },
                    ),
                    SizedBox(
                      width: 80,
                      child: TextField(
                        controller: _secController,
                        focusNode: _secFocusNode,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        onChanged: _updateFromSecString,
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                          shadows: [
                            Shadow(
                              color: shadowColor,
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: false,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const Text(
                      'TAP TO EDIT',
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xFF475569),
                        letterSpacing: 1,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 36,
                      ),
                      onPressed: () {
                        context.read<PaceCubit>().decrementSeconds();
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'MIN  :  SEC  /  100M',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xFF475569),
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
