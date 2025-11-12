import 'package:flutter/material.dart';
import '../models/exam_model.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  String formatDateTime(DateTime dt) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(dt.day)}.${twoDigits(dt.month)}.${dt.year} - ${twoDigits(dt.hour)}:${twoDigits(dt.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final color = exam.isPassed ? Colors.blueGrey[100] : Colors.blue[100];
    final borderColor = exam.isPassed ? Colors.blueGrey : Colors.blue;

    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor!, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exam.subject, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_month, size: 20),
                const SizedBox(width: 6),
                Text(formatDateTime(exam.date)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 20),
                const SizedBox(width: 6),
                Text(exam.location.join(', ')),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                exam.isPassed ? "Поминат" : "Претстоен",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: exam.isPassed ? Colors.blueGrey[800] : Colors.blue[800],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
