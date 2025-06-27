import 'package:flutter/material.dart';

class MoodTracker extends StatefulWidget {
  const MoodTracker({super.key});

  @override
  State<MoodTracker> createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {
  String? selectedMood;
  final TextEditingController noteController = TextEditingController();
  final List<Map<String, dynamic>> moods = [
    {'emoji': '😄', 'label': 'Happy'},
    {'emoji': '🙂', 'label': 'Fine'},
    {'emoji': '😐', 'label': 'Neutral'},
    {'emoji': '😞', 'label': 'Sad'},
    {'emoji': '😢', 'label': 'Upset'},
  ];
  final List<Map<String, dynamic>> moodHistory = [];

  void _saveMood() {
    if (selectedMood != null) {
      setState(() {
        moodHistory.insert(0, {
          'emoji': selectedMood,
          'note': noteController.text,
        });
        selectedMood = null;
        noteController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Mood and note saved! 💾'),
          backgroundColor: Colors.purple.shade300,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5E8FF), Color(0xFFE5D2FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'How are you feeling today?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: moods.map((mood) {
                  final isSelected = selectedMood == mood['emoji'];
                  return GestureDetector(
                    onTap: () => setState(() => selectedMood = mood['emoji']),
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected ? Colors.purple : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            mood['emoji'],
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          mood['label'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.purple : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: noteController,
                decoration: InputDecoration(
                  hintText: 'Write a note (optional)',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMood,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                ),
                child: const Text('Save Mood'),
              ),
              const SizedBox(height: 30),
              if (moodHistory.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mood History',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...moodHistory.map((entry) => Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: Text(
                          entry['emoji'],
                          style: const TextStyle(fontSize: 24),
                        ),
                        title: Text(entry['note'].isEmpty ? 'No note' : entry['note']),
                      ),
                    )),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
