import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'pages/home_page.dart';
import 'pages/schedule_page.dart';
import 'pages/assignments_page.dart';
import 'pages/notes_page.dart';

// Titik awal aplikasi Flutter
void main() => runApp(const CampusPlannerApp());

// Widget utama aplikasi
class CampusPlannerApp extends StatefulWidget {
  const CampusPlannerApp({Key? key}) : super(key: key);

  @override
  State<CampusPlannerApp> createState() => _CampusPlannerAppState();
}

class _CampusPlannerAppState extends State<CampusPlannerApp> {
  int _selectedIndex = 0; // Menyimpan indeks halaman yang aktif
  Map<String, dynamic>? appData; // Menyimpan data dari file JSON

  // Placeholder yang ditampilkan sementara data belum dimuat
  final List<Widget> _pagesPlaceholder = [
    Center(child: CircularProgressIndicator()),
    Center(child: CircularProgressIndicator()),
    Center(child: CircularProgressIndicator()),
    Center(child: CircularProgressIndicator()),
  ];

  @override
  void initState() {
    super.initState();
    _loadData(); // Memanggil fungsi untuk memuat data dummy
  }

  // Fungsi untuk memuat file JSON dari folder assets
  Future<void> _loadData() async {
    final jsonString = await rootBundle.loadString('assets/dummy_data.json');
    final data = json.decode(jsonString) as Map<String, dynamic>;
    setState(() {
      appData = data;
    });
  }

  // Fungsi untuk mengubah halaman berdasarkan menu yang diklik
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tema utama aplikasi
    final theme = ThemeData(
      primarySwatch: Colors.indigo,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Poppins',
    );

    // Menentukan halaman yang akan ditampilkan
    final pages = appData == null
        ? _pagesPlaceholder // Menampilkan loading jika data belum siap
        : [
            HomePage(data: appData!),
            SchedulePage(data: appData!),
            AssignmentsPage(data: appData!),
            NotesPage(data: appData!)
          ];

    // Struktur utama aplikasi dengan bottom navigation bar
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusPlanner',
      theme: theme,
      home: Scaffold(
        body: SafeArea(child: pages[_selectedIndex]), // Halaman aktif
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.indigo[700],
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedule'),
            BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: 'Assignments'),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
          ],
        ),
      ),
    );
  }
}
