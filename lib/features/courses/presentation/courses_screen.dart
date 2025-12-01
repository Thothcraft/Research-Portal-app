/// Courses screen showing available research training courses

import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          _buildCourseCard(
            context,
            title: 'Introduction to IoT Research',
            instructor: 'Dr. Sarah Johnson',
            duration: '6 weeks',
            level: 'Beginner',
            enrolledCount: 245,
            rating: 4.8,
            topics: ['IoT Basics', 'Sensors', 'Data Collection'],
          ),
          const SizedBox(height: 16),
          _buildCourseCard(
            context,
            title: 'Machine Learning for IoT',
            instructor: 'Prof. Michael Chen',
            duration: '8 weeks',
            level: 'Intermediate',
            enrolledCount: 189,
            rating: 4.9,
            topics: ['ML Algorithms', 'Edge Computing', 'Model Training'],
          ),
          const SizedBox(height: 16),
          _buildCourseCard(
            context,
            title: 'Advanced Data Analytics',
            instructor: 'Dr. Emily Rodriguez',
            duration: '10 weeks',
            level: 'Advanced',
            enrolledCount: 127,
            rating: 4.7,
            topics: ['Big Data', 'Real-time Analytics', 'Visualization'],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Research Training Courses',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Enhance your research skills with expert-led courses',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  Widget _buildCourseCard(
    BuildContext context, {
    required String title,
    required String instructor,
    required String duration,
    required String level,
    required int enrolledCount,
    required double rating,
    required List<String> topics,
  }) {
    Color levelColor;
    switch (level.toLowerCase()) {
      case 'beginner':
        levelColor = Colors.green;
        break;
      case 'intermediate':
        levelColor = Colors.orange;
        break;
      case 'advanced':
        levelColor = Colors.red;
        break;
      default:
        levelColor = Colors.grey;
    }

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: levelColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    level,
                    style: TextStyle(
                      color: levelColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.person, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  instructor,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.schedule, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  duration,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber[700]),
                const SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.people, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  '$enrolledCount enrolled',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: topics.map((topic) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    topic,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Enrolled in: $title')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Enroll Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
