import 'package:flutter/material.dart';

class WelcomeWrapper extends StatelessWidget {
  const WelcomeWrapper({
    required this.child,
    required this.pageController,
    required this.isNextDisabled,
    this.showBackButton = true,
    this.onNextPressed,
    super.key,
  });

  final Widget child;
  final PageController pageController;
  final bool isNextDisabled;
  final bool showBackButton;
  final VoidCallback? onNextPressed;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(
        top: 25.0,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) => child),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showBackButton)
                CircleAvatar(
                  child: IconButton(
                    onPressed: () async => pageController.previousPage(
                      duration: Durations.medium1,
                      curve: Curves.bounceIn,
                    ),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              if (!showBackButton) const SizedBox(),
              CircleAvatar(
                child: IconButton(
                  onPressed: isNextDisabled
                      ? null
                      : () async {
                          onNextPressed?.call();

                          // if (!context.mounted) return;
                          // FocusScope.of(context).unfocus();
                        },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
