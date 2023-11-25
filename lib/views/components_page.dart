import 'package:flutter/material.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/layout/responsive_layout_builder.dart';
import 'package:flutteri/widgets/navbar.dart';

class MyComponentsPage extends StatelessWidget {
  const MyComponentsPage({super.key});

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
          return child!;
        },
        child: (ResponsiveLayoutSize layoutSize) {
          switch (layoutSize) {
            case ResponsiveLayoutSize.small:
              return bodyWidget(context,
                  padding: horizontalPadding12 + verticalPadding12);
            case ResponsiveLayoutSize.medium:
              return bodyWidget(context,
                  padding: horizontalPadding32 + verticalPadding16);
            case ResponsiveLayoutSize.large:
              return bodyWidget(context,
                  padding: horizontalPadding48 + verticalPadding24);
          }
        },
      ),
    );
  }

  Widget bodyWidget(BuildContext context, {EdgeInsets? padding}) {
    return ListView(
      padding: padding,
      children: [
        Text(
          'Component UI',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        verticalMargin16,
        ResponsiveLayoutBuilder(
          small: (BuildContext context, Widget? child) {
            return child!;
          },
          medium: (BuildContext context, Widget? child) {
            return child!;
          },
          large: (BuildContext context, Widget? child) {
            return child!;
          },
          child: (ResponsiveLayoutSize layoutSize) {
            switch (layoutSize) {
              case ResponsiveLayoutSize.small:
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return verticalMargin12;
                  },
                  itemCount: 10,
                  shrinkWrap: true,
                );
              default:
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (var _ in [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
                      const ComponentsCardWidget(),
                  ],
                );
            }
          },
        ),
        verticalMargin32,
      ],
    );
  }
}

class ComponentsCardWidget extends StatefulWidget {
  const ComponentsCardWidget({
    super.key,
  });

  @override
  State<ComponentsCardWidget> createState() => _ComponentsCardWidgetState();
}

class _ComponentsCardWidgetState extends State<ComponentsCardWidget> {
  double width = 450;
  double height = 350;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 515 && constraints.maxWidth < 700) {
        width = 450;
        height = 350;
      } else if (constraints.maxWidth > 700 && constraints.maxWidth < 1000) {
        width = 400;
        height = 300;
      } else {
        width = 325;
        height = 280;
      }
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Center(child: Text('$constraints height $height')),
      );
    });
  }
}
