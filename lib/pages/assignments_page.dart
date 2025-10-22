import 'package:flutter/material.dart';
import 'assignment_detail_page.dart';

// Halaman daftar tugas (Assignments Page)
class AssignmentsPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const AssignmentsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<AssignmentsPage> createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> {
  String selectedFilter = 'All'; // Filter tampilan tugas

  @override
  Widget build(BuildContext context) {
    final allAssignments = List.from(widget.data['assignments'] ?? []);

    // Filter tugas berdasarkan status
    List filteredAssignments;
    if (selectedFilter == 'Ongoing') {
      filteredAssignments =
          allAssignments.where((a) => (a['progress'] as num) < 1.0).toList();
    } else if (selectedFilter == 'Completed') {
      filteredAssignments =
          allAssignments.where((a) => (a['progress'] as num) == 1.0).toList();
    } else {
      filteredAssignments = allAssignments;
    }

    // Hitung rata-rata progres semua tugas
    double overallProgress = 0;
    if (allAssignments.isNotEmpty) {
      overallProgress = allAssignments
              .map((a) => (a['progress'] as num).toDouble())
              .reduce((a, b) => a + b) /
          allAssignments.length;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header halaman
              Row(
                children: [
                  const Icon(Icons.assignment_rounded,
                      color: Colors.indigo, size: 30),
                  const SizedBox(width: 10),
                  const Text(
                    'Assignments',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Progress keseluruhan dalam bentuk lingkaran
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: CircularProgressIndicator(
                        value: overallProgress,
                        strokeWidth: 12,
                        color: Colors.indigo,
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${(overallProgress * 100).round()}%',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Overall Progress',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Tombol filter tugas
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('All', Colors.indigo),
                    _buildFilterChip('Ongoing', Colors.orange),
                    _buildFilterChip('Completed', Colors.green),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Jika tidak ada tugas
              if (filteredAssignments.isEmpty)
                _emptyState("No assignments found 🎓")
              else
                // Tampilkan daftar tugas
                Column(
                  children: filteredAssignments.map((a) {
                    final progress = (a['progress'] as num).toDouble();
                    final isDone = progress == 1.0;

                    return GestureDetector(
                      // Navigasi ke halaman detail tugas
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AssignmentDetailPage(assignment: a),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Ikon status tugas
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: isDone
                                    ? Colors.green.shade100
                                    : Colors.indigo.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isDone
                                    ? Icons.check_circle_rounded
                                    : Icons.edit_note_rounded,
                                color: isDone
                                    ? Colors.green.shade700
                                    : Colors.indigo,
                                size: 26,
                              ),
                            ),
                            const SizedBox(width: 14),

                            // Detail tugas
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    a['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Deadline: ${a['deadline']}',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // Progress bar tugas
                                  TweenAnimationBuilder<double>(
                                    tween: Tween(
                                        begin: 0, end: progress.clamp(0, 1)),
                                    duration:
                                        const Duration(milliseconds: 600),
                                    curve: Curves.easeOutCubic,
                                    builder: (context, value, _) => ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: LinearProgressIndicator(
                                        value: value,
                                        minHeight: 8,
                                        backgroundColor: Colors.grey.shade200,
                                        color: isDone
                                            ? Colors.green
                                            : Colors.indigo,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),

                                  // Persentase progres tugas
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '${(progress * 100).round()}%',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: isDone
                                            ? Colors.green.shade700
                                            : Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget filter kategori tugas
  Widget _buildFilterChip(String label, Color color) {
    final isSelected = selectedFilter == label;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : color,
            fontWeight: FontWeight.w600,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => setState(() => selectedFilter = label),
        selectedColor: color,
        backgroundColor: Colors.grey.shade200,
        elevation: isSelected ? 3 : 0,
        pressElevation: 2,
        labelPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      ),
    );
  }

  // Tampilan jika tidak ada data
  Widget _emptyState(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );
  }
}
