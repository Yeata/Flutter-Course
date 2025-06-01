import 'package:flutter/material.dart';
import 'course.dart';
class RowCourseCards extends StatelessWidget {
  final String title;
  final int activeDotIndex;
  
  const RowCourseCards({
    super.key,
    required this.title,
    required this.activeDotIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        
        // Horizontal scrollable course cards
        SizedBox(
          height: 320, // Adjust based on your card height
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            children: [
              CourseCard(),
              const SizedBox(width: 12.0),
              CourseCard(),
              const SizedBox(width: 12.0),
              CourseCard(),
            ],
          ),
        ),
        
        // Dot indicators
        const SizedBox(height: 16.0),
        _buildDotIndicators(),
      ],
    );
  }

  Widget _buildDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == activeDotIndex 
                ? Colors.blue 
                : Colors.grey.withOpacity(0.4),
          ),
        );
      }),
    );
  }
}