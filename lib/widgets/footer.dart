import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/images/image.png', width: 152),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FooterItem('About Us'),
                FooterItem('Contact Us'),
                FooterItem('FaQs'),
                FooterItem('Community Forum'),
                FooterItem('Term of Service'),
                FooterItem('Careers'),
                FooterItem('Leadership'),
                FooterItem('Blog'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FooterItem('Social Impact'),
                FooterItem('Cookies Setting'),
                FooterItem('Terms'),
                FooterItem('Accessibility Statement'),
                FooterItem('Investors'),
                FooterItem('GO Pro Course'),
                FooterItem('Affiliate'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text(
          'Certified',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            fontSize: 14,
          ),
        ),
        Center(child: Image.asset('assets/images/image14.png', width: 125)),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.facebook, size: 30),
            SizedBox(width: 12),
            Icon(Icons.insert_chart_rounded, size: 30),
            SizedBox(width: 12),
            Icon(Icons.video_library, size: 30),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          '2023 Worktency, Inc. All rights reserved.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

class FooterItem extends StatelessWidget {
  final String text;

  const FooterItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Ubuntu',
          fontSize: 14,
        ),
      ),
    );
  }
}
