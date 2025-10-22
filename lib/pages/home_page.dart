import 'package:flutter/material.dart';
import 'add_task_page.dart';
import 'schedule_detail_page.dart';

// Halaman utama aplikasi
class HomePage extends StatefulWidget {
  final Map<String, dynamic> data;
  const HomePage({Key? key, required this.data}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Data pengguna, jadwal, dan tugas
    final user = widget.data['user'] ?? {};
    final schedule = List.from(widget.data['schedule'] ?? []);
    final tasks = List.from(widget.data['tasks'] ?? []);

    // Tanggal hari ini
    final today = DateTime.now();
    final todayStr =
        "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    // Filter kelas hari ini
    final classesToday = schedule
        .where((item) => item['type'] == 'class' && item['date'] == todayStr)
        .toList();

    // Menampilkan dua tugas pertama
    final previewTasks =
        tasks.length > 2 ? tasks.sublist(0, 2) : List.from(tasks);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Header profil pengguna
              Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.indigo.shade100,
                    child: Text(
                      (user['name'] ?? 'U').toString()[0],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Sapaan pengguna
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, ${user['name'] ?? 'Student'} 👋',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Let’s make today productive!',
                          style: TextStyle(color: Colors.grey[600], fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  // Tombol notifikasi
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_rounded,
                        size: 28, color: Colors.indigo),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Bagian kelas hari ini
              const Text(
                "Today's Classes",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black87),
              ),
              const SizedBox(height: 12),

              // Jika tidak ada kelas
              if (classesToday.isEmpty)
                _emptyState("No classes today 🎉")
              else
                // Menampilkan daftar kelas
                Column(
                children: classesToday.map((c) {
                  return GestureDetector(
                    onTap: () {
                      // Pindah ke detail kelas
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScheduleDetailPage(schedule: c),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.indigo.shade50, Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Info kelas
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c['subject'] ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.indigo,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text('⏰ ${c['time']}',
                                    style: TextStyle(color: Colors.grey[700])),
                                Text('📍 ${c['location']}',
                                    style: TextStyle(color: Colors.grey[700])),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              size: 18, color: Colors.grey),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              // Bagian tugas hari ini
              const Text(
                "Today's Tasks",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black87),
              ),
              const SizedBox(height: 12),

              // Jika tidak ada tugas
              if (previewTasks.isEmpty)
                _emptyState("No tasks for today 🎯")
              else
                // Menampilkan daftar tugas
                Column(
                  children: previewTasks.map((t) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          // Checkbox status tugas
                          Checkbox(
                            value: t['status'] ?? false,
                            onChanged: (val) {
                              setState(() {
                                t['status'] = val!;
                              });
                            },
                            activeColor: Colors.indigo,
                          ),
                          const SizedBox(width: 8),

                          // Info tugas
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  t['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    decoration: (t['status'] ?? false)
                                        ? TextDecoration.lineThrough
                                        : null,
                                    color: (t['status'] ?? false)
                                        ? Colors.grey
                                        : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '⏰ ${t['time']}',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

              const SizedBox(height: 30),

              // Tombol tambah tugas
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Buka halaman tambah tugas
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddTaskPage(existingTasks: tasks),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_rounded, color: Colors.white),
                  label: const Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Tampilan jika data kosong
  Widget _emptyState(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}
