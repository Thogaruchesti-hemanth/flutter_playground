import 'package:flutter/material.dart';

class TapSelectionScreen extends StatefulWidget {
  const TapSelectionScreen({super.key});

  @override
  State<TapSelectionScreen> createState() => _TapSelectionScreenState();
}

class _TapSelectionScreenState extends State<TapSelectionScreen> {
  final List<String> _tags = [
    "Flutter",
    "Dart",
    "Firebase",
    "Android",
    "iOS",
    "Web",
    "AI",
    "ML",
    "UI/UX",
    "Backend",
    "Cloud",
    "DevOps",
  ];

  final List<String> _selectedTags = [];

  void _toggleSelection(String tag) {
    setState(() {
      if (_selectedTags.contains(tag)) {
        _selectedTags.remove(tag);
      } else {
        _selectedTags.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tag Selection")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Tags:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.start,
              children:
                  _tags.map((tag) {
                    bool isSelected = _selectedTags.contains(tag);
                    return ChoiceChip(
                      label: Text(tag),
                      selected: isSelected,
                      selectedColor: Colors.blue.shade200,
                      onSelected: (selected) => _toggleSelection(tag),
                    );
                  }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              "Selected Tags:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  _selectedTags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
