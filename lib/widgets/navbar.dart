import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/routes/routes.dart';
import 'package:flutteri/theme/theme_service.dart';
import 'package:flutteri/widgets/buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leadingWidth: 0,
      leading: emptyWidget,
      title: InkWell(
        onTap: () => context.go(RoutePath.home.path),
        child: const Text(
          'Flutteri',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.3),
        ),
      ),
      actions: [
        BoxIconButton(
          icon: const Icon(AkarIcons.github_fill, size: 16),
          onTap: () {
            launchUrl(
              Uri.parse('https://github.com/Prashant4900/flutteri'),
              mode: LaunchMode.externalApplication,
            );
          },
        ),
        horizontalMargin12,
        BoxIconButton(
          icon: const Icon(Icons.light_mode, size: 16),
          onTap: () {
            Provider.of<ThemeService>(context, listen: false)
                .toggleThemeMode(context);
          },
        ),
        horizontalMargin12,
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
