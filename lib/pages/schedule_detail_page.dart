import 'package:flutter/material.dart';

class ScheduleDetailPage extends StatelessWidget {
  final Map<String, dynamic> schedule;
  const ScheduleDetailPage({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typeColor = _getTypeColor(schedule['type']);
    final typeIcon = _getTypeIcon(schedule['type']);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: Text(
          schedule['subject'] ?? 'Schedule Detail',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: typeColor,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: typeColor.withOpacity(0.4),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [typeColor.withOpacity(0.1), Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: typeColor.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: typeColor.withOpacity(0.15),
                    child: Icon(typeIcon, color: typeColor, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          schedule['subject'] ?? 'Untitled Class',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          schedule['type']?.toString().toUpperCase() ?? '',
                          style: TextStyle(
                            color: typeColor,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // 🔹 Info Section
            _infoCard([
              _infoRow(Icons.access_time_rounded, "Time", schedule['time']),
              _infoRow(Icons.calendar_today_rounded, "Date", schedule['date']),
              _infoRow(Icons.location_on_rounded, "Location", schedule['location']),
              _infoRow(Icons.person_rounded, "Lecturer", schedule['lecturer'] ?? "Not specified"),
            ]),

            const SizedBox(height: 26),

            // 🔹 Description Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.indigo.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "📝 Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    schedule['description'] ?? 'No details available for this activity.',
                    style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: typeColor,
                  elevation: 4,
                  shadowColor: typeColor.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔸 Sub-widgets for clarity
  Widget _infoCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _infoRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo, size: 22),
          const SizedBox(width: 12),
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value ?? '-',
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTypeIcon(String? type) {
    switch (type) {
      case 'class':
        return Icons.school_rounded;
      case 'event':
        return Icons.event_rounded;
      case 'meeting':
        return Icons.groups_rounded;
      case 'organization':
        return Icons.people_alt_rounded;
      case 'task':
        return Icons.task_alt_rounded;
      case 'guidance':
        return Icons.person_pin_circle_rounded;
      default:
        return Icons.calendar_today_rounded;
    }
  }

  Color _getTypeColor(String? type) {
    switch (type) {
      case 'class':
        return Colors.indigo;
      case 'event':
        return Colors.pink;
      case 'meeting':
        return Colors.orange;
      case 'organization':
        return Colors.green;
      case 'task':
        return Colors.red;
      case 'guidance':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
