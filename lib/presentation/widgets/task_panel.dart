import 'package:flutter/material.dart';

class TaskPanel extends StatelessWidget {
  final double screenWidth;
  final double top;
  final Widget child;

  const TaskPanel({
    super.key,
    required this.screenWidth,
    required this.top,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: screenWidth * 0.85,
          height: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colors.secondaryContainer,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
