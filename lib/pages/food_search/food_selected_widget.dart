import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@immutable
class ExpandableFab extends HookWidget {
  const ExpandableFab({super.key});

  @override
  Widget build(BuildContext context) {
    final open = useState(false);
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );

    void toggle() {
      open.value = !open.value;
      if (open.value) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }

    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: Center(
              child: Material(
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                elevation: 4,
                child: InkWell(
                  onTap: toggle,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: CurvedAnimation(
              curve: Curves.fastOutSlowIn,
              reverseCurve: Curves.easeOutQuad,
              parent: controller,
            ),
            // ignore: prefer_expression_function_bodies
            builder: (context, child) {
              // final offset = Offset.fromDirection(
              //   directionInDegrees * (math.pi / 180.0),
              //   progress.value * maxDistance,
              // );
              return Positioned(
                left: 0,
                bottom: 100.0,
                child: Transform.rotate(
                  angle:
                      (1.0 -
                          CurvedAnimation(
                            curve: Curves.fastOutSlowIn,
                            reverseCurve: Curves.easeOutQuad,
                            parent: controller,
                          ).value) *
                      math.pi /
                      2,
                  child: child,
                ),
              );
            },
            child: FadeTransition(
              opacity: CurvedAnimation(
                curve: Curves.linear,
                reverseCurve: Curves.easeOutQuad,
                parent: controller,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 20,
                  color: Colors.amber,
                  child: const Text(
                    '',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          IgnorePointer(
            ignoring: open.value,
            child: AnimatedContainer(
              transformAlignment: Alignment.center,
              transform: Matrix4.diagonal3Values(
                open.value ? 0.7 : 1.0,
                open.value ? 0.7 : 1.0,
                1.0,
              ),
              duration: const Duration(milliseconds: 250),
              curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
              child: AnimatedOpacity(
                opacity: open.value ? 0.0 : 1.0,
                curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
                duration: const Duration(milliseconds: 250),
                child: FloatingActionButton(
                  onPressed: toggle,
                  child: const Icon(Icons.dinner_dining),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
