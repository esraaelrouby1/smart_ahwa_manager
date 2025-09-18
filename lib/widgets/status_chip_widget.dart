import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final bool isServed;
  final VoidCallback onTap;

  const StatusChip({super.key, required this.isServed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isServed ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          isServed ? "Complete" : "Pending",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
