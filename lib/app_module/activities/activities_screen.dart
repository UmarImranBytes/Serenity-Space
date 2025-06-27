import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'breathing_exercise.dart';
import 'mood_tracker.dart';
import 'quick_exercise.dart';
import 'daily_quote.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellness Activities'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildActivityCard(
              title: 'Breathing Exercise',
              icon: Icons.self_improvement,
              color: Colors.teal,
              onTap: () => Get.to(() => const BreathingExercise()),
            ),
            _buildActivityCard(
              title: 'Mood Tracker',
              icon: Icons.emoji_emotions,
              color: Colors.purple,
              onTap: () => Get.to(() => const MoodTracker()),
            ),
            _buildActivityCard(
              title: 'Quick Exercise',
              icon: Icons.fitness_center,
              color: Colors.orange,
              onTap: () => Get.to(() => const QuickExercise()),
            ),
            _buildActivityCard(
              title: 'Daily Quote',
              icon: Icons.format_quote,
              color: Colors.indigo,
              onTap: () => Get.to(() => const DailyQuote()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.1),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
