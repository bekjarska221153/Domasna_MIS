import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(
      subject: 'Веб базирани системи',
      date: DateTime.now().add(const Duration(days: 1, hours: 3)),
      location: ['лаб.117', 'лаб.215'],
      isPassed: false,
    ),
    Exam(
      subject: 'Бази на податоци',
      date: DateTime.now().add(const Duration(days: 4)),
      location: ['лаб.200ab'],
      isPassed: false,
    ),
    Exam(
      subject: 'Веб програмирање',
      date: DateTime.now().subtract(const Duration(days: 3)),
      location: ['лаб.138','лаб.12','лаб.13'],
      isPassed: true,
    ),
    Exam(
      subject: 'Мобилни информациски системи',
      date: DateTime.now().add(const Duration(days: 10)),
      location: ['лаб.2', 'лаб.3'],
      isPassed: false,
    ),
    Exam(
      subject: 'Веројатност и статистика',
      date: DateTime.now().subtract(const Duration(days: 5)),
      location: ['АМФ ФИНКИ Г','Барака 1'],
      isPassed: true,
    ),
    Exam(
      subject: 'Интегрирани системи',
      date: DateTime.now().add(const Duration(days: 15, hours: 2)),
      location: ['лаб.215'],
      isPassed: false,
    ),
    Exam(
      subject: 'Компјутерски мрежи',
      date: DateTime.now().add(const Duration(days: 7)),
      location: ['лаб.200в','лаб.138'],
      isPassed: false,
    ),
    Exam(
      subject: 'Дизајн и архитектура на софтвер',
      date: DateTime.now().subtract(const Duration(days: 2)),
      location: ['лаб.117','лаб.215'],
      isPassed: true,
    ),
    Exam(
      subject: 'Калкулус',
      date: DateTime.now().add(const Duration(days: 20)),
      location: ['Барака 3.2','АМФ ФИНКИ Г'],
      isPassed: false,
    ),
    Exam(
      subject: 'Софтверско инженерство',
      date: DateTime.now().add(const Duration(days: 30)),
      location: ['лаб.2','лаб.3','лаб.13'],
      isPassed: false,
    ),
  ];

  ExamListScreen({super.key});

  String _formatDate(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}";
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final sortedExams = exams..sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 221153'),
      ),
      body: ListView.builder(
        itemCount: sortedExams.length,
        itemBuilder: (context, index) {
          final exam = sortedExams[index];
          return Card(
            color: exam.isPassed ? Colors.blueGrey[100] : Colors.blue[50],
            margin: const EdgeInsets.all(8),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                exam.isPassed ? Icons.check_circle : Icons.schedule,
                color: exam.isPassed ? Colors.blueGrey : Colors.blue,
              ),
              title: Text(exam.subject),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      Text('${_formatDate(exam.date)} ${_formatTime(exam.date)}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.room, size: 16),
                      const SizedBox(width: 4),
                      Text(exam.location.join(', ')),
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExamDetailScreen(exam: exam),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.blue[100],
        padding: const EdgeInsets.all(12),
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
