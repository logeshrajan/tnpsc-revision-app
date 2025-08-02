import 'package:flutter/material.dart';

class MCQScreen extends StatefulWidget {
  const MCQScreen({super.key});

  @override
  State<MCQScreen> createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MCQ Practice'),
      ),
      body: const Center(
        child: Text(
          'MCQ Screen\n(To be implemented)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
