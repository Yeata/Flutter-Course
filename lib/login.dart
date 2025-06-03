import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String language;
  final bool isDarkMode;
  final Function(String) onLanguageChanged;
  final Function(bool) onThemeChanged;

  LoginScreen({
    required this.language,
    required this.isDarkMode,
    required this.onLanguageChanged,
    required this.onThemeChanged,
  });

  final Map<String, Map<String, String>> localizedStrings = {
    'en': {
      'login': 'Log in',
      'greeting': 'Hello!',
      'username': 'Username',
      'password': 'Password',
      'darkMode': 'Dark Mode',
    },
    'fr': {
      'login': 'Connexion',
      'greeting': 'Salut!',
      'username': "Nom d'utilisateur",
      'password': 'Mot de passe',
      'darkMode': 'Mode sombre',
    },
    'kh': {
      'login': 'ចូល',
      'greeting': 'សួស្ដី!',
      'username': 'ឈ្មោះអ្នកប្រើប្រាស់',
      'password': 'ពាក្យសម្ងាត់',
      'darkMode': 'របៀបងងឹត',
    },
  };

  @override
  Widget build(BuildContext context) {
    final strings = localizedStrings[language]!;

    return Scaffold(
      appBar: AppBar(
        title: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4), // tweak spacing
              child: Text(
                strings['login']!,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 3, // thiccness
                color: Colors.orange,
                margin: const EdgeInsets.only(
                  right: 40,
                ), // makes line shorter or longer
              ),
            ),
          ],
        ), // optional: for a flat clean look
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: Image.asset(
                'assets/images/image.png',
                height: 60, // adjust size as needed
              ),
            ),
            const SizedBox(height: 30),
            Text(
              strings['greeting']!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: strings['username'],
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: strings['password'],
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {},
              child: Text(strings['login']!),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                langBtn('🇺🇸 EN', 'en'),
                const SizedBox(width: 10),
                langBtn('🇫🇷 FR', 'fr'),
                const SizedBox(width: 10),
                langBtn('🇰🇭 KH', 'kh'),
              ],
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: Text(strings['darkMode']!),
              value: isDarkMode,
              onChanged: onThemeChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget langBtn(String label, String langCode) {
    final isSelected = langCode == language;

    return ElevatedButton(
      onPressed: () => onLanguageChanged(langCode),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.orange : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        side: const BorderSide(color: Colors.orange),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}