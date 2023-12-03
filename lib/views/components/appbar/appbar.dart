import 'package:flutter/material.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/views/components/appbar/simple_appbar_sandbox.dart';

class AppBarComponents extends StatelessWidget {
  const AppBarComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyCodeSandBox(
          widget: AppBar(
            title: Text(
              'Simple AppBar',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
              const SizedBox(width: 10),
            ],
          ),
          code: '''
AppBar(
  title: Text(
    'Simple AppBar',
    style: Theme.of(context).textTheme.titleMedium,
    ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.more_vert),
    ),
    const SizedBox(width: 10),
  ],
)''',
          title: 'Simple App Bar',
          maxHeight: 300,
          minHeight: 100,
        ),
        verticalMargin24,
        MyCodeSandBox(
          widget: AppBar(
            title: Text(
              'Simple AppBar',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
              const SizedBox(width: 10),
            ],
          ),
          code: '''
AppBar(
  title: Text(
    'Simple AppBar',
    style: Theme.of(context).textTheme.titleMedium,
    ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.more_vert),
    ),
    const SizedBox(width: 10),
  ],
)''',
          title: 'Simple App Bar',
          maxHeight: 300,
          minHeight: 100,
        ),
      ],
    );
  }
}
