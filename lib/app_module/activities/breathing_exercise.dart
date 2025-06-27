import 'dart:async';
import 'package:flutter/material.dart';

class BreathingExercise extends StatefulWidget {
  const BreathingExercise({super.key});

  @override
  State<BreathingExercise> createState() => _BreathingExerciseState();
}

class _BreathingExerciseState extends State<BreathingExercise>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> steps = [
    {'label': 'Inhale', 'duration': 4, 'color': Colors.teal},
    {'label': 'Hold', 'duration': 4, 'color': Colors.blue},
    {'label': 'Exhale', 'duration': 6, 'color': Colors.purple},
  ];

  int currentStep = 0;
  late AnimationController _controller;
  Timer? _stepTimer;
  Timer? _sessionTimer;
  int sessionTime = 60; // total session duration in seconds
  int timeLeft = 60; // for countdown
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: steps[currentStep]['duration']),
    )..repeat(reverse: true);

    _startSession();
    _startStepCycle();
  }

  void _startSession() {
    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!isPaused && timeLeft > 0) {
        setState(() => timeLeft--);
      } else if (timeLeft == 0) {
        timer.cancel();
        _stepTimer?.cancel();
        _controller.stop();
        setState(() {});
      }
    });
  }

  void _startStepCycle() {
    _stepTimer = Timer(Duration(seconds: steps[currentStep]['duration']), _nextStep);
  }

  void _nextStep() {
    if (!mounted || isPaused || timeLeft == 0) return;
    setState(() {
      currentStep = (currentStep + 1) % steps.length;
      _controller.duration = Duration(seconds: steps[currentStep]['duration']);
      _controller.forward(from: 0);
    });
    _startStepCycle();
  }

  void _togglePause() {
    setState(() => isPaused = !isPaused);
    if (isPaused) {
      _controller.stop();
      _stepTimer?.cancel();
    } else {
      _controller.forward();
      _startStepCycle();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _stepTimer?.cancel();
    _sessionTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = steps[currentStep];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breathing Exercise'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            timeLeft > 0 ? 'Time Left: ${timeLeft}s' : 'Session Complete 🎉',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          ScaleTransition(
            scale: Tween(begin: 0.8, end: 1.2).animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
            ),
            child: Container(
              width: 180,
              height: 180,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    (current['color'] as Color).withOpacity(0.4),
                    current['color'] as Color
                  ],
                ),
              ),
              child: Text(
                current['label'],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          LinearProgressIndicator(
            value: _controller.value,
            minHeight: 8,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(
              current['color'] as Color,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: timeLeft == 0 ? null : _togglePause,
            icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
            label: Text(isPaused ? 'Resume' : 'Pause'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
