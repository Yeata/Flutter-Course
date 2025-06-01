import 'package:flutter/material.dart';

class CategoryTabBar extends StatelessWidget {
  final List<CategoryTab> categories;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const CategoryTabBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: categories.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.black : Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        if (tab.isPro)
                          const TextSpan(
                            text: 'PRO ',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        TextSpan(text: tab.label),
                        TextSpan(
                          text: ' (${tab.count})',
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (isSelected)
                    Container(
                      height: 2,
                      width: 20,
                      color: Colors.orange,
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CategoryTab {
  final String label;
  final int count;
  final bool isPro;

  const CategoryTab({
    required this.label,
    required this.count,
    this.isPro = false,
  });
}
