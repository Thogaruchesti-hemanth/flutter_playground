import 'package:flutter/material.dart';

// Course category data
class CategoryData {
  final String title;
  final IconData icon;
  final Color color;

  const CategoryData({
    required this.title,
    required this.icon,
    required this.color,
  });
}

// Course data model
class CourseData {
  final String title;
  final String subtitle;
  final String rating;
  final String lessons;
  final Color color;
  final IconData icon;

  const CourseData({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.lessons,
    required this.color,
    required this.icon,
  });
}

// Enum for filter selection
enum SelectionState { selected, unselected }

// Category filter options model
class FilterOptions {
  String label;
  bool isSelected; // Use bool instead of enum

  FilterOptions({required this.label, this.isSelected = false});
}
