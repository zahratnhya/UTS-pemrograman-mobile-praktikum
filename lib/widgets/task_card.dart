import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String time;
  final String deadline;
  final bool done;

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
        color: done ? Colors.green.shade50 : Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration:
                          done ? TextDecoration.lineThrough : TextDecoration.none,
                    )),
                const SizedBox(height: 4),
                Text("Deadline: $deadline",
                    style: TextStyle(
                        fontSize: 13,
                        color: done ? Colors.grey : Colors.redAccent)),
              ],
            ),
          ),
          Icon(
            done ? Icons.check_circle : Icons.circle_outlined,
            color: done ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}
