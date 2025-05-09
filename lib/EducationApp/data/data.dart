import 'package:flutter/material.dart';
import 'package:profile_page/EducationApp/models/CategoryData.dart';

// Expanded Course Categories
final List<CategoryData> categories = [
  CategoryData(
    title: 'Programming',
    icon: Icons.code,
    color: Color(0xff4285F4),
  ),
  CategoryData(
    title: 'Development',
    icon: Icons.developer_mode,
    color: Color(0xffE55934),
  ),
  CategoryData(
    title: 'Business',
    icon: Icons.business,
    color: Color(0xff34A853),
  ),
  CategoryData(
    title: 'Marketing',
    icon: Icons.mark_email_read,
    color: Color(0xffE63946),
  ),
  CategoryData(
    title: 'Photography',
    icon: Icons.camera_alt,
    color: Color(0xffE63946),
  ),
  CategoryData(
    title: 'Design',
    icon: Icons.design_services,
    color: Color(0xffFF6D00),
  ),
  // CategoryData(title: 'Science', icon: Icons.science, color: Color(0xff9C27B0)),
  // CategoryData(
  //   title: 'Mathematics',
  //   icon: Icons.calculate,
  //   color: Color(0xff2196F3),
  // ),
  // CategoryData(
  //   title: 'Languages',
  //   icon: Icons.language,
  //   color: Color(0xffFF9800),
  // ),
  // CategoryData(
  //   title: 'Music',
  //   icon: Icons.music_note,
  //   color: Color(0xff673AB7),
  // ),
  // CategoryData(
  //   title: 'Finance',
  //   icon: Icons.attach_money,
  //   color: Color(0xff4CAF50),
  // ),
  // CategoryData(
  //   title: 'Health & Fitness',
  //   icon: Icons.fitness_center,
  //   color: Color(0xffD81B60),
  // ),
];

// Expanded Trending Courses
final List<CourseData> trendingCourses = [
  CourseData(
    title: 'Calculus 101',
    subtitle: 'Learning Calculus Basics',
    rating: '4.9',
    lessons: '20 lessons',
    color: Color(0xff42b883),
    icon: Icons.calculate,
  ),
  CourseData(
    title: 'Flutter Development',
    subtitle: 'Build iOS and Android apps with a single codebase',
    rating: '4.8',
    lessons: '20 lessons',
    color: Color(0xff42b883),
    icon: Icons.flutter_dash,
  ),
  CourseData(
    title: 'Digital Marketing Masterclass',
    subtitle: 'SEO, Google Ads, and Social Media Marketing',
    rating: '4.7',
    lessons: '18 lessons',
    color: Color(0xffFF6D00),
    icon: Icons.trending_up,
  ),
  CourseData(
    title: 'Photography for Beginners',
    subtitle: 'Learn to capture stunning images',
    rating: '4.5',
    lessons: '15 lessons',
    color: Color(0xffE63946),
    icon: Icons.camera_alt,
  ),
  CourseData(
    title: 'Python for Data Science',
    subtitle: 'Master Python for ML & AI',
    rating: '4.9',
    lessons: '25 lessons',
    color: Color(0xff4285F4),
    icon: Icons.computer,
  ),
  CourseData(
    title: 'Graphic Design Basics',
    subtitle: 'Learn Adobe Photoshop & Illustrator',
    rating: '4.6',
    lessons: '22 lessons',
    color: Color(0xff9C27B0),
    icon: Icons.brush,
  ),
  CourseData(
    title: 'Business Analytics',
    subtitle: 'Data-driven decision-making skills',
    rating: '4.7',
    lessons: '19 lessons',
    color: Color(0xff34A853),
    icon: Icons.analytics,
  ),
  CourseData(
    title: 'UI/UX Design Fundamentals',
    subtitle: 'Design modern and interactive interfaces',
    rating: '4.8',
    lessons: '16 lessons',
    color: Color(0xff673AB7),
    icon: Icons.design_services,
  ),
  CourseData(
    title: 'Music Theory Essentials',
    subtitle: 'Learn to read and write music',
    rating: '4.4',
    lessons: '12 lessons',
    color: Color(0xffFF9800),
    icon: Icons.music_note,
  ),
  CourseData(
    title: 'Personal Finance & Investing',
    subtitle: 'Manage money, save, and invest wisely',
    rating: '4.9',
    lessons: '20 lessons',
    color: Color(0xff4CAF50),
    icon: Icons.attach_money,
  ),
];

// Expanded Filter Options
final List<FilterOptions> filterOptions = [
  FilterOptions(isSelected: true, label: 'All'),
  FilterOptions(label: 'Programming'),
  FilterOptions(label: 'Development'),
  FilterOptions(label: 'Business'),
  FilterOptions(label: 'Marketing'),
  FilterOptions(label: 'Photography'),
  FilterOptions(label: 'Design'),
  FilterOptions(label: 'Science'),
  FilterOptions(label: 'Mathematics'),
  FilterOptions(label: 'Languages'),
  FilterOptions(label: 'Music'),
  FilterOptions(label: 'Finance'),
  FilterOptions(label: 'Health & Fitness'),
];

final List<CourseData> allcourses = [
  CourseData(
    title: 'Calculus 101',
    subtitle: 'Learning calculus basics',
    rating: '4.9',
    lessons: '20 lessons',
    color: Color(0xff42b883),
    icon: Icons.calculate,
  ),
  CourseData(
    title: 'Flutter Development',
    subtitle: 'Build iOS and Android apps',
    rating: '4.8',
    lessons: '20 lessons',
    color: Color(0xff42b883),
    icon: Icons.flutter_dash,
  ),
  CourseData(
    title: 'Data Science',
    subtitle: 'Learn Machine Learning & AI',
    rating: '4.7',
    lessons: '25 lessons',
    color: Color(0xffe63946),
    icon: Icons.bar_chart,
  ),
  CourseData(
    title: 'Photography Basics',
    subtitle: 'Master photography techniques',
    rating: '4.6',
    lessons: '18 lessons',
    color: Color(0xffe55934),
    icon: Icons.camera_alt,
  ),
];
