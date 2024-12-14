import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';

class CommonDialog extends HookConsumerWidget {
  const CommonDialog(
      {required this.title,
      required this.content,
      required this.onSubmit,
      super.key});

  final String title;
  final Widget content;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Dialog(
        insetPadding:
            const EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 100),
        child: Container(
          padding:
              const EdgeInsets.only(left: 30, top: 58, right: 30, bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              content,
              TextButton(
                onPressed: onSubmit,
                child: Text(GeneralStrings.submit),
              )
            ],
          ),
        ),
      );
}
