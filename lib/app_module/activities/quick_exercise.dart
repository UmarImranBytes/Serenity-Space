import 'package:flutter/material.dart';

class QuickExercise extends StatelessWidget {
  const QuickExercise({super.key});

  final List<Map<String, dynamic>> exercises = const [
    {'label': 'Stretching', 'icon': Icons.accessibility_new},
    {'label': 'Jumping Jacks', 'icon': Icons.directions_run},
    {'label': 'Yoga Pose', 'icon': Icons.self_improvement},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Exercise'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE5B4), Color(0xFFFFD9A0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Try one of these quick exercises!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 20),
            ...exercises.map((exercise) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${exercise['label']} selected! 🏃‍♂️'),
                      backgroundColor: Colors.orange.shade300,
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    child: Row(
                      children: [
                        Icon(exercise['icon'], color: Colors.orange, size: 32),
                        const SizedBox(width: 20),
                        Text(
                          exercise['label'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
