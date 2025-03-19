import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const PortfolioPage(),
    );
  }
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AeroVision', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/Me.png'), 
            ),
            const SizedBox(height: 20),

            // Welcome Text
            const Text(
              'Welcome to my Portfolio',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            // Name and Role
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: 'Hi I\'m\n'),
                  TextSpan(
                    text: 'YOUS Yeata\n',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(text: 'Mobile Developer'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Collaborating with highly skilled individuals, our agency delivers top-quality services.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Hire Me Button (Telegram)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _launchURL('https://www.facebook.com/share/18ZvNaoLbg/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Hire Me!', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 15),

            // Download CV Button (LinkedIn or CV Link)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  _launchURL('https://www.linkedin.com/in/yeata-yous-a284b7319/');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Download CV',
                    style: TextStyle(fontSize: 18, color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
