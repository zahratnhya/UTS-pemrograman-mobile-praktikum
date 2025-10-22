import 'package:flutter/material.dart';

class AssignmentDetailPage extends StatefulWidget {
  final Map<String, dynamic> assignment;
  const AssignmentDetailPage({Key? key, required this.assignment})
      : super(key: key);

  @override
  State<AssignmentDetailPage> createState() => _AssignmentDetailPageState();
}

class _AssignmentDetailPageState extends State<AssignmentDetailPage> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = (widget.assignment['progress'] ?? 0.0) >= 1.0;
  }

  @override
  Widget build(BuildContext context) {
    final a = widget.assignment;
    final double progress = (a['progress'] as num?)?.toDouble() ?? 0.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(
          a['title'] ?? 'Assignment Detail',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Judul
            Text(
              a['subject'] ?? 'Course',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Deadline: ${a['deadline']}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),

            const SizedBox(height: 24),

            // 🔹 Card Progress
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Progress",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress.clamp(0.0, 1.0),
                      minHeight: 12,
                      backgroundColor: Colors.grey.shade200,
                      color: isCompleted
                          ? Colors.greenAccent.shade700
                          : Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${(progress * 100).round()}% completed',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isCompleted
                            ? Colors.green.shade700
                            : Colors.indigo.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Card Info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _infoRow(Icons.book_rounded, "Course", a['subject'] ?? "-"),
                  const SizedBox(height: 10),
                  _infoRow(Icons.calendar_month_rounded, "Deadline",
                      a['deadline'] ?? "-"),
                  const SizedBox(height: 10),
                  _infoRow(Icons.info_outline_rounded, "Status",
                      isCompleted ? "Completed" : "In Progress"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Description Section dengan gradasi biru-putih
            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.indigo.shade50,
                    Colors.indigo.shade100.withOpacity(0.4),
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                a['description'] ??
                    "No additional description for this assignment.",
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 Button Section
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: isCompleted
                    ? Column(
                        key: const ValueKey('done'),
                        children: const [
                          Icon(Icons.check_circle_rounded,
                              color: Colors.green, size: 70),
                          SizedBox(height: 10),
                          Text(
                            'This assignment is completed 🎉',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          key: const ValueKey('mark_btn'),
                          onPressed: () {
                            setState(() {
                              isCompleted = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Marked as completed ✅'),
                                backgroundColor: Colors.black87,
                              ),
                            );
                          },
                          icon: const Icon(Icons.check_circle_outline_rounded,
                              color: Colors.white),
                          label: const Text(
                            'Mark as Completed',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.indigo, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey)),
              const SizedBox(height: 2),
              Text(value,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }
}
