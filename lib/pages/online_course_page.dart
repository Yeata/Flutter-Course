import 'package:flutter/material.dart';

import '../widgets/card_image.dart';
import '../widgets/searchbar.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/row_course_card.dart';
import '../widgets/footer.dart';
import 'search_page.dart'; // << Add this import to bring in SearchPage

class OnlineCoursePage extends StatefulWidget {
  const OnlineCoursePage({super.key});

  @override
  State<OnlineCoursePage> createState() => _OnlineCoursePageState();
}

class _OnlineCoursePageState extends State<OnlineCoursePage> {
  int _selectedIndex = 0;
  final List<String> _courseCategories = [
    'Cyber Security',
    'Network Administrator',
    'Cryptography',
  ];
  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearchChanged(String query) {
    debugPrint('Search query: $query');
    if (query.toLowerCase().contains('network')) {
      // Navigate to SearchPage when user types 'network'
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF164F89)),
        title: Image.asset(
          'assets/images/image.png',
          width: 152.4,
          height: 30,
          fit: BoxFit.contain,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomSearchBar(
              onSearchChanged: _handleSearchChanged, // <--- HERE
            ),
            const SizedBox(height: 20),
            // Banner Cards
            ...List.generate(
              3,
              (_) => const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CardWithImage(
                  title: 'Explore your favourite subject',
                  T_course: 'Machine Learning',
                  description:
                      '“Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”',
                  imagePath: 'assets/images/image13.png',
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Course Sections
            ..._courseCategories.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: RowCourseCards(
                  title: category,
                  activeDotIndex: index,
                ),
              );
            }).toList(),
            const SizedBox(height: 40),
            Footer(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
