import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/theme/cubit/theme_cubit.dart';
import 'package:flutteri/widgets/buttons.dart';

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
      title: const Text(
        'Flutteri',
        style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.3),
      ),
      actions: [
        const BoxIconButton(
          icon: Icon(AkarIcons.github_fill, size: 16),
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
