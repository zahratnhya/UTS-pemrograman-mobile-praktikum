import 'package:flutter/material.dart';

// Halaman untuk menambah tugas baru
class AddTaskPage extends StatefulWidget {
  final List existingTasks;
  const AddTaskPage({Key? key, required this.existingTasks}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>(); // Kunci form untuk validasi
  String title = ''; // Menyimpan judul tugas
  String time = '';  // Menyimpan waktu tugas
  bool status = false; // Status tugas (selesai/belum)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: const Text(
          'Add New Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container utama untuk form input
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Task Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Input judul tugas
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.edit_note, color: Colors.indigo),
                          labelText: 'Task Title',
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (val) => title = val,
                        validator: (val) => val == null || val.isEmpty
                            ? 'Please enter a task title'
                            : null,
                      ),

                      const SizedBox(height: 16),

                      // Input waktu tugas
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.access_time, color: Colors.indigo),
                          labelText: 'Time (e.g. 14:30 PM)',
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (val) => time = val,
                        validator: (val) => val == null || val.isEmpty
                            ? 'Please enter the task time'
                            : null,
                      ),

                      const SizedBox(height: 28),

                      // Tombol simpan tugas
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Validasi form sebelum menyimpan
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(context, {
                                'title': title,
                                'time': time,
                                'status': false,
                              });
                            }
                          },
                          icon: const Icon(Icons.save_rounded,
                              color: Colors.white, size: 22),
                          label: const Text(
                            'Save Task',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.indigo,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
