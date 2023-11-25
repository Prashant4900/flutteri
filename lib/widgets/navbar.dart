import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/theme/cubit/theme_cubit.dart';
import 'package:flutteri/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    super.key,
  });

  Future<void> _launchUrl(String url) async {
    final url0 = Uri.parse(url);

    if (!await launchUrl(url0)) {
      // throw Exception('Could not launch $url0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leadingWidth: 0,
      leading: emptyWidget,
      title: const Text(
        'Flutteri',
        style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.3),
      ),
      actions: [
        BoxIconButton(
          icon: const Icon(AkarIcons.github_fill, size: 16),
          onTap: () => _launchUrl('https://github.com/Prashant4900/flutteri'),
        ),
        horizontalMargin12,
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return BoxIconButton(
              icon: const Icon(Icons.light_mode, size: 16),
              onTap: () {
                Brightness brightness = Theme.of(context).brightness;
                if (brightness == Brightness.light) {
                  context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
                } else {
                  context.read<ThemeCubit>().changeTheme(ThemeMode.light);
                }
              },
            );
          },
        ),
        horizontalMargin12,
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
