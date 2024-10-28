import 'package:flutter/material.dart';

class MealItemTrain extends StatelessWidget {
  const MealItemTrain({required this.text, required this.icon, super.key});
  final IconData icon;
  final String text;

  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
