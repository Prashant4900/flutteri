import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/layout/responsive/responsive_layout_builder.dart';
import 'package:flutteri/routes/routes.dart';
import 'package:flutteri/views/widgets/buttons.dart';
import 'package:flutteri/views/widgets/features_widget.dart';
import 'package:flutteri/views/widgets/navbar.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: ResponsiveLayoutBuilder(
        small: (BuildContext context, Widget? child) {
          return child!;
        },
        medium: (BuildContext context, Widget? child) {
          return child!;
        },
        large: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  'assets/bg.svg',
                  width: 600,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              child!,
            ],
          );
        },
        child: (ResponsiveLayoutSize layoutSize) {
          switch (layoutSize) {
            case ResponsiveLayoutSize.small:
              return bodyWidget(context, padding: horizontalPadding12);
            case ResponsiveLayoutSize.medium:
              return bodyWidget(context, padding: horizontalPadding32);
            case ResponsiveLayoutSize.large:
              return bodyWidget(context, padding: horizontalPadding48);
          }
        },
      ),
    );
  }

  Widget bodyWidget(BuildContext context, {EdgeInsets? padding}) {
    return ListView(
      padding: padding,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalMargin48,
            verticalMargin48,
            verticalMargin48,
            verticalMargin24,
            Text(
              'FLUTTERi UI',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.7),
            ),
            verticalMargin12,
            Text(
              '123 responsive components',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Text(
              'built with Flutteri UI.',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            verticalMargin24,
            LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width:
                      constraints.maxWidth > 500 ? 500 : constraints.maxWidth,
                  child: Text(
                    '''Build your next website even faster with premade responsive components designed and built by Mantine maintainers and community. All components are free forever for everyone.''',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                );
              },
            ),
            verticalMargin16,
            ResponsiveLayoutBuilder(
              small: (BuildContext context, Widget? child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                          label: 'Browse Components',
                          width: MediaQuery.sizeOf(context).width / 2.25,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          onTap: () {
                            context.goNamed(RoutePath.categories.path);
                          },
                        ),
                        CustomElevatedButton(
                          label: 'Github',
                          prefixIcon: AkarIcons.github_fill,
                          width: MediaQuery.sizeOf(context).width / 2.25,
                          onTap: () {
                            launchUrl(
                              Uri.parse(
                                'https://github.com/Prashant4900/flutteri',
                              ),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                        ),
                      ],
                    ),
                    verticalMargin12,
                    CustomElevatedButton(
                      label: 'Get started with Flutteri',
                      suffixIcon: AkarIcons.tablet_device,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ],
                );
              },
              medium: (BuildContext context, Widget? child) {
                return child!;
              },
              large: (BuildContext context, Widget? child) {
                return child!;
              },
              child: (ResponsiveLayoutSize size) {
                return Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    CustomElevatedButton(
                      label: 'Browse Components',
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      onTap: () {
                        context.goNamed(RoutePath.categories.path);
                      },
                    ),
                    CustomElevatedButton(
                      label: 'Github',
                      prefixIcon: AkarIcons.github_fill,
                      onTap: () {
                        launchUrl(
                          Uri.parse('https://github.com/Prashant4900/flutteri'),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                    const CustomElevatedButton(
                      label: 'Get started with Flutteri',
                      suffixIcon: AkarIcons.tablet_device,
                    ),
                  ],
                );
              },
            ),
            verticalMargin48,
            verticalMargin48,
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 800) {
                  return ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => verticalMargin24,
                    itemBuilder: (context, index) {
                      return FeaturesWidget(index: index);
                    },
                  );
                }
                return SizedBox(
                  height: 200,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 240,
                        child: FeaturesWidget(index: index),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return horizontalMargin32;
                    },
                    itemCount: 3,
                  ),
                );
              },
            ),
            verticalMargin48,
          ],
        ),
      ],
    );
  }
}
