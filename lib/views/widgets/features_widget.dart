import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/gen/assets.gen.dart';

final featureList = [
  {
    'icon': Assets.svg.fire.path,
    'title': 'Flexible',
    'subtitle': '''
All components are built with Flutteri theme, change colors, fonts, shadows and other properties.''',
  },
  {
    'icon': Assets.svg.night.path,
    'title': 'Light and dark theme',
    'subtitle': '''
Most components support both dark and light color schemes by default, no additional modifications needed.''',
  },
  {
    'icon': Assets.svg.scroll.path,
    'title': 'Free for everyone',
    'subtitle': '''
Free, open source, community-driven, MIT license. Use anywhere, including commercial projects.''',
  },
];

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: allPadding12,
            child: SvgPicture.asset(
              featureList[index]['icon']!,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        verticalMargin8,
        Text(
          featureList[index]['title']!,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        verticalMargin4,
        Text(
          featureList[index]['subtitle']!,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
