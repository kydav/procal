import 'package:flutter/material.dart';
import 'package:procal/theme.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress(
      {required this.current, required this.total, super.key});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                value: (current == 0 && total == 0) ? 0 : current / total,
                valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.primary),
                backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                strokeWidth: 10,
                strokeCap: StrokeCap.round,
              ),
            ),
            Align(
              child: Text(
                '$current / $total',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    color: ColorPalette.brandOne,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      );
}
