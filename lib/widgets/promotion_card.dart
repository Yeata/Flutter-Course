import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const PromotionCard({Key? key, required this.imagePath, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 125,
      decoration: BoxDecoration(
        color: Color(0xFF6892F1).withOpacity(0.09),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            ClipRRect(
              child: Image.asset(
                imagePath,
                width: 80.89,
                height: 69.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF8402),
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
