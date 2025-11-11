import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  final Function(String, IconData) onCategorySelected;

  const SelectCategory({super.key, required this.onCategorySelected});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  String? selectedCategory;

  final List<Map<String, dynamic>> categories = [
    {'name': 'Work', 'icon': Icons.work, 'color': Colors.blue},
    {'name': 'Study', 'icon': Icons.school, 'color': Colors.green},
    {'name': 'Home', 'icon': Icons.home, 'color': Colors.orange},
    {'name': 'Shopping', 'icon': Icons.shopping_cart, 'color': Colors.purple},
    {'name': 'Health', 'icon': Icons.favorite, 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Category', style: TextStyle(fontSize: 17)),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedCategory == category['name'];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = category['name'];
                  });
                  widget.onCategorySelected(category['name'], category['icon']);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? category['color'].withOpacity(0.2)
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected
                          ? category['color']
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        category['icon'],
                        color: isSelected
                            ? category['color']
                            : Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(category['name']),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
