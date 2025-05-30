import 'package:flutter/material.dart';

class FormFieldTitle extends StatelessWidget {
  const FormFieldTitle(
      {required this.title,
      required this.child,
      this.isRequired = false,
      this.topPadding = 12,
      this.bottomPadding = 6,
      super.key});
  final String title;
  final bool isRequired;
  final double topPadding;
  final double bottomPadding;
  final Widget child;

  @override
  Widget build(context) => Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 7.0),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: title,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary)),
                        TextSpan(
                            text: isRequired ? '*' : '',
                            style: const TextStyle(color: Colors.red))
                      ])),
                    ),
                  ),
                  child
                ],
              ),
            )
          ],
        ),
      );
}
