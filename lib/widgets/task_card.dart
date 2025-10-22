import 'package:flutter/material.dart';

// Widget untuk menampilkan kartu tugas (Task Card)
class TaskCard extends StatelessWidget {
  final String title;     // Judul tugas
  final String time;      // Waktu tugas
  final String deadline;  // Tenggat waktu tugas
  final bool done;        // Status apakah tugas sudah selesai

  const TaskCard({
    Key? key,
    required this.title,
    required this.time,
    required this.deadline,
    required this.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: done ? Colors.green.shade50 : Colors.indigo.shade50, // Warna latar berdasarkan status
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bagian kiri menampilkan detail tugas
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none, // Coret teks jika selesai
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Deadline: $deadline",
                  style: TextStyle(
                    fontSize: 13,
                    color: done ? Colors.grey : Colors.redAccent, // Warna teks berdasarkan status
                  ),
                ),
              ],
            ),
          ),

          // Ikon status tugas di sisi kanan
          Icon(
            done ? Icons.check_circle : Icons.circle_outlined,
            color: done ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}
