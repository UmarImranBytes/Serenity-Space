import 'package:flutter/material.dart';
import 'dart:math';

class DailyQuote extends StatefulWidget {
  const DailyQuote({super.key});

  @override
  State<DailyQuote> createState() => _DailyQuoteState();
}

class _DailyQuoteState extends State<DailyQuote>
    with SingleTickerProviderStateMixin {
  final List<String> quotes = [
    'You are stronger than you think.',
    'One day at a time, one step at a time.',
    'Your mind is a garden. Your thoughts are the seeds.',
    'Breathe. Believe. Receive.',
    "It's okay to not be okay. You're doing great.",
    'This too shall pass.',
    'Every moment is a fresh beginning.'
  ];

  late String currentQuote;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    currentQuote = quotes[Random().nextInt(quotes.length)];

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _getNewQuote() {
    _controller.reverse().then((_) {
      setState(() {
        currentQuote = quotes[Random().nextInt(quotes.length)];
      });
      _controller.forward();
    });
  }

  void _shareQuote() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Shared: "$currentQuote"'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Quote'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0D4F7), Color(0xFFC6C1F1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 6,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Icon(Icons.format_quote, size: 48, color: Colors.indigo),
                      const SizedBox(height: 16),
                      Text(
                        currentQuote,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _getNewQuote,
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const Text(
                    'New Quote',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _shareQuote,
                  icon: const Icon(Icons.share, color: Colors.white),
                  label: const Text(
                    'Share',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
