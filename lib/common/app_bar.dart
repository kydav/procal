import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:procal/constants/asset_icons.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/services/device_services/auth_service.dart';

class ProcalAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ProcalAppBar({
    this.showMenu = false,
    this.showBackButton = false,
    this.showLogo = true,
    this.onBackPressed,
    this.content,
    super.key,
  });

  final bool showMenu;
  final bool showBackButton;
  final bool showLogo;
  final VoidCallback? onBackPressed;
  final Widget? content;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title:
          content ??
          (showLogo
              ? Image.asset(AssetIcons.horizontalTransparentLogo, height: 45)
              : null),
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.chevron_left_outlined, size: 30),
              onPressed: onBackPressed,
            )
          : null,
      actions: [
        if (showMenu)
          IconButton(
            icon: const Icon(Icons.menu, size: 30),
            onPressed: () => showModalBottomSheet(
              context: context,
              clipBehavior: Clip.antiAlias,
              showDragHandle: true,
              elevation: 5,
              isScrollControlled: true,
              builder: (context) => SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: FilledButton(
                          onPressed: () => ref
                              .read(authServiceProvider.notifier)
                              .logoutUser(),
                          child: Text(GeneralStrings.logOut),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );

  @override
  Size get preferredSize => const Size.fromHeight(65.0);
}
