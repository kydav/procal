import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress(
      {required this.current,
      required this.total,
      required this.title,
      required this.sizeFactor,
      super.key});

  final int current;
  final int total;
  final String title;
  final int sizeFactor;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        width: sizeFactor * 5,
        height: sizeFactor * 5,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: sizeFactor * 4,
                width: sizeFactor * 4,
                child: CircularProgressIndicator(
                  value: (current == 0 && total == 0) ? 0 : current / total,
                  valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).colorScheme.primary),
                  backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                  strokeWidth: sizeFactor * .4,
                  strokeCap: StrokeCap.round,
                ),
              ),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: sizeFactor * .6,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    '$current / $total',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: sizeFactor * .36,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
