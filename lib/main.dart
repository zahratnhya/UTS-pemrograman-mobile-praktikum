import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'pages/home_page.dart';
import 'pages/schedule_page.dart';
import 'pages/assignments_page.dart';
import 'pages/notes_page.dart';

void main() => runApp(const CampusPlannerApp());

class CampusPlannerApp extends StatefulWidget {
  const CampusPlannerApp({Key? key}) : super(key: key);

  @override
  State<CampusPlannerApp> createState() => _CampusPlannerAppState();
}

class _CampusPlannerAppState extends State<CampusPlannerApp> {
  int _selectedIndex = 0;
  Map<String, dynamic>? appData;

  final List<Widget> _pagesPlaceholder = [
    Center(child: CircularProgressIndicator()),
    Center(child: CircularProgressIndicator()),
    Center(child: CircularProgressIndicator()),
    Center(child: CircularProgressIndicator()),
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final jsonString = await rootBundle.loadString('assets/dummy_data.json');
    final data = json.decode(jsonString) as Map<String, dynamic>;
    setState(() {
      appData = data;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      primarySwatch: Colors.indigo,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Poppins',
    );

    final pages = appData == null
        ? _pagesPlaceholder
        : [
            HomePage(data: appData!),
            SchedulePage(data: appData!),
            AssignmentsPage(data: appData!),
            NotesPage(data: appData!)
          ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusPlanner',
      theme: theme,
      home: Scaffold(
        body: SafeArea(child: pages[_selectedIndex]),
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
