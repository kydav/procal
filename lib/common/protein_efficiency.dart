import 'package:flutter/material.dart';

class ProteinEfficiency extends StatelessWidget {
  const ProteinEfficiency({
    required this.protein,
    required this.calories,
    this.height = 20,
    super.key,
  });
  final double protein;
  final double calories;
  final double height;

  Color getColor(double ratio) {
    if (ratio >= 0.8) {
      return Colors.green;
    } else if (ratio < .8 && ratio > .6) {
      return Colors.blue;
    } else if (ratio >= 0.5) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ratio = calories > 0
        ? (((protein * 10) / calories) > 1.0
              ? 1.0
              : ((protein * 10) / calories))
        : 0.0;
    final barWidth = ratio.clamp(0.0, 1.0);
    final proteinPer100Calories = calories > 0
        ? (protein / calories) * 100
        : 0.0; // Calculate protein per 100 calories

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (height > 10) ...[
          Text(
            'Protein per 100 calories: ${proteinPer100Calories.toStringAsFixed(1)}g',
          ),
          const SizedBox(height: 8),
        ],
        Stack(
          children: [
            Container(
              height: height,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: height,
              width: 200 * barWidth,
              decoration: BoxDecoration(
                color: getColor(ratio),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
