import 'package:flutter/material.dart';
import '../models/exam_model.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _timeRemaining() {
    final now = DateTime.now();
    final diff = exam.date.difference(now);
    if (diff.isNegative) return "Испитот е веќе одржан.";

    final days = diff.inDays;
    final hours = diff.inHours.remainder(24);
    return "$days дена, $hours часа";
  }

  String _formatDate(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}";
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Предмет: ${exam.subject}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 5),
                    Text("Датум: ${_formatDate(exam.date)}"),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 5),
                    Text("Време: ${_formatTime(exam.date)}"),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.room),
                    const SizedBox(width: 5),
                    Expanded(child: Text("Простории: ${exam.location.join(', ')}")),
                  ],
                ),
                const SizedBox(height: 20),
                Text("Преостанато време: ${_timeRemaining()}", style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
