import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const NotesPage({Key? key, required this.data}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _titleCtrl = TextEditingController();
  final _bodyCtrl = TextEditingController();
  late List notes;

  @override
  void initState() {
    super.initState();
    notes = List.from(widget.data['notes'] ?? []);
  }

  void _saveNote() {
    final title = _titleCtrl.text.trim();
    final body = _bodyCtrl.text.trim();
    if (title.isEmpty && body.isEmpty) return;
    setState(() {
      notes.insert(0, {"title": title.isEmpty ? 'Untitled' : title, "summary": body, "date": DateTime.now().toString().split(' ')[0]});
      _titleCtrl.clear();
      _bodyCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Important Notes', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        TextField(
          controller: _titleCtrl,
          decoration: InputDecoration(hintText: 'Note title', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _bodyCtrl,
          minLines: 3,
          maxLines: 5,
          decoration: InputDecoration(hintText: 'Start writing...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _saveNote,
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('Save Note')),
          ),
        ),
        const SizedBox(height: 18),
        Text('Notes', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        Column(
          children: notes.map<Widget>((n) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(n['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(n['summary'], style: TextStyle(color: Colors.grey[700])),
                const SizedBox(height: 6),
                Text(n['date'], style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              ]),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
