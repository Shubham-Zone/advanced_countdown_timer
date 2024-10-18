library advanced_countdown_timer;

import 'dart:async';
import 'package:flutter/material.dart';

/// A customizable countdown timer widget for Flutter.
class AdvancedCountdownTimer extends StatefulWidget {
  /// Duration for the countdown timer.
  final Duration duration;

  /// Style for the countdown timer text.
  final TextStyle? textStyle;

  /// Color for the circular progress bar.
  final Color progressColor;

  /// Callback when the countdown starts.
  final VoidCallback? onStart;

  /// Callback when the countdown pauses.
  final VoidCallback? onPause;

  /// Callback when the countdown completes.
  final VoidCallback? onComplete;

  const AdvancedCountdownTimer({
    super.key,
    required this.duration,
    this.textStyle,
    this.progressColor = Colors.blue,
    this.onStart,
    this.onPause,
    this.onComplete,
  });

  @override
  AdvancedCountdownTimerState createState() => AdvancedCountdownTimerState();
}

class AdvancedCountdownTimerState extends State<AdvancedCountdownTimer> {
  late Duration _remainingTime;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _resetTimer();
  }

  void _startTimer() {
    widget.onStart?.call();
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        });
      } else {
        _timer?.cancel();
        widget.onComplete?.call();
      }
    });
  }

  void _pauseTimer() {
    widget.onPause?.call();
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
  }

  void _resetTimer() {
    setState(() {
      _remainingTime = widget.duration;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: _remainingTime.inSeconds / widget.duration.inSeconds,
              color: widget.progressColor,
            ),
            Text(
              '${_remainingTime.inMinutes}:${_remainingTime.inSeconds % 60}',
              style: widget.textStyle ?? Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isRunning ? _pauseTimer : _startTimer,
              child: Text(_isRunning ? 'Pause' : 'Start'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _resetTimer,
              child: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}
