import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.work, 'color': Colors.grey, 'label': 'Work'},
    {'icon': Icons.favorite, 'color': Colors.orange, 'label': 'Love'},
    {'icon': Icons.home, 'color': Colors.green, 'label': 'Home'},
    {'icon': Icons.calendar_month, 'color': Colors.purple, 'label': 'Event'},
    {'icon': Icons.person, 'color': Colors.blue, 'label': 'Personal'},
  ];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Category', style: TextStyle(fontSize: 17)),
        SizedBox(width: 25),
        Expanded(
          child: SizedBox(
            height: 70, // controla el tamaño del contenedor
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 15),
              scrollDirection: Axis.horizontal, // importante
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final selected = index == selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: category['color'].withOpacity(0.15),
                      border: Border.all(
                        color: category['color'],
                        width: selected ? 4 : 2,
                      ),
                    ),
                    child: Icon(
                      category['icon'],
                      color: category['color'],
                      size: 28,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
