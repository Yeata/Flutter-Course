import 'package:flutter/material.dart';

class CardWithImage extends StatelessWidget {
  final String title;
  final String T_course;
  final String description;
  final String imagePath;

  const CardWithImage({
    super.key,
    required this.title,
    required this.T_course,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title row with arrow
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            children: [
              const Icon(Icons.chevron_right, color: Color(0xFFEE6019), size: 28),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Card with image, T_course, and description
        Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 12),

              // T_course centered in card
              Center(
                child: Text(
                  T_course,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Description with padding
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Indicator bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _indicatorBox(true),
              const SizedBox(width: 8),
              _indicatorBox(false),
              const SizedBox(width: 8),
              _indicatorBox(false),
              const SizedBox(width: 8),
              _indicatorBox(false),
              const SizedBox(width: 8),
              _indicatorBox(false),
            ],
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }

  // lil helper
  Widget _indicatorBox(bool isActive) {
    return Container(
      width: 32,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
