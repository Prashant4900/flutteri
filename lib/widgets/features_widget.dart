import 'package:flutter/material.dart';
import 'package:flutteri/constants/common.dart';

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({
    super.key,
  });

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
        ),
        verticalMargin8,
        Text(
          'Light and dark theme',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        verticalMargin4,
        Text(
          'All components are built with Mantine theme, change colors, fonts, shadows and other properties.',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
              ),
        )
      ],
    );
  }
}
