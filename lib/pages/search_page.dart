import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/footer.dart';
import '../widgets/searchbar.dart';
import '../widgets/category_tab_bar.dart'; 

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedTab = 0;

  final List<CategoryTab> _tabs = const [
    CategoryTab(label: 'All', count: 43),
    CategoryTab(label: 'Courses', count: 22),
    CategoryTab(label: 'Projects', count: 3),
    CategoryTab(label: 'sessions', count: 3, isPro: true),
    CategoryTab(label: 'Live', count: 15),
  ];

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CustomSearchBar(),
          const SizedBox(height: 16),
          CategoryTabBar(
            categories: _tabs,
            selectedIndex: _selectedTab,
            onTabSelected: (index) {
              setState(() {
                _selectedTab = index;
              });
            },
          ),
          const SizedBox(height: 16),
          ...List.generate(5, (_) => const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CustomCard(),
              )),
          const SizedBox(height: 40),
          const Footer(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
