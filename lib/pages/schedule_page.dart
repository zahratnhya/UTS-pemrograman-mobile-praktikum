import 'package:flutter/material.dart';
import 'schedule_detail_page.dart';

class SchedulePage extends StatefulWidget {
  final Map<String, dynamic> data;
  const SchedulePage({Key? key, required this.data}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int selectedDay = DateTime.now().day;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  // 🔹 Ambil semua jadwal berdasarkan tanggal
  List<Map<String, dynamic>> getScheduleForDay() {
    final schedule = List<Map<String, dynamic>>.from(widget.data['schedule'] ?? []);
    final selectedDate =
        DateTime(selectedYear, selectedMonth, selectedDay).toIso8601String().split('T')[0];
    return schedule.where((s) => s['date'] == selectedDate).toList();
  }

  Widget _simpleCalendar(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(selectedYear, selectedMonth);
    final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Header bulan dan navigasi
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                setState(() {
                  if (selectedMonth == 1) {
                    selectedMonth = 12;
                    selectedYear--;
                  } else {
                    selectedMonth--;
                  }
                });
              },
            ),
            Text(
              '${_monthName(selectedMonth)} $selectedYear',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                setState(() {
                  if (selectedMonth == 12) {
                    selectedMonth = 1;
                    selectedYear++;
                  } else {
                    selectedMonth++;
                  }
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days
              .map((d) => Text(d, style: const TextStyle(color: Colors.grey)))
              .toList(),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 6,
          runSpacing: 8,
          children: List.generate(daysInMonth, (i) {
            final day = i + 1;
            final isSelected = day == selectedDay;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDay = day;
                });
              },
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.indigo[300] : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? Colors.indigo : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  '$day',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final todaysSchedule = getScheduleForDay();
    final classEvents =
        todaysSchedule.where((s) => s['type'] == 'class').toList();
    final otherEvents =
        todaysSchedule.where((s) => s['type'] != 'class').toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Schedule',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _simpleCalendar(context),
          const SizedBox(height: 20),
          Text(
            "Schedule for ${selectedDay} ${_monthName(selectedMonth)}",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 12),

          if (todaysSchedule.isEmpty)
            const Center(
              child: Text('No events scheduled on this day 📅',
                  style: TextStyle(color: Colors.grey)),
            ),

          if (classEvents.isNotEmpty) ...[
            const Text('📚 Classes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 8),
            Column(
              children: classEvents.map((s) {
                return _eventTile(s, Colors.indigo.shade50);
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],

          if (otherEvents.isNotEmpty) ...[
            const Text('🗓 Activities',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 8),
            Column(
              children: otherEvents.map((s) {
                return _eventTile(s, Colors.pink.shade50);
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _eventTile(Map<String, dynamic> s, Color bgColor) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScheduleDetailPage(schedule: s),
        ),
      );
    },
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s['subject'] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(s['time'] ?? '',
                    style: TextStyle(color: Colors.grey[700], fontSize: 13)),
                if (s['location'] != null)
                  Text('📍 ${s['location']}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    ),
  );
}

}
