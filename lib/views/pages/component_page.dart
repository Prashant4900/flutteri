import 'package:flutter/material.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/layout/responsive/responsive_layout_builder.dart';
import 'package:flutteri/layout/switch/switch_case_widget.dart';
import 'package:flutteri/routes/component_page_args.dart';
import 'package:flutteri/views/widgets/buttons.dart';
import 'package:flutteri/views/widgets/navbar.dart';

class MyComponentPage extends StatelessWidget {
  const MyComponentPage({
    required this.args,
    super.key,
  });

  final ComponentPageArgs args;

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
              return bodyWidget(
                context,
                padding: horizontalPadding12 + verticalPadding16,
              );
            case ResponsiveLayoutSize.medium:
              return bodyWidget(
                context,
                padding: horizontalPadding32 + verticalPadding16,
              );
            case ResponsiveLayoutSize.large:
              return bodyWidget(
                context,
                padding: horizontalPadding48 + verticalPadding24,
              );
          }
        },
      ),
    );
  }

  Widget bodyWidget(BuildContext context, {required EdgeInsets padding}) {
    final categoryName = args.categoryName;
    return ListView(
      shrinkWrap: true,
      padding: padding,
      children: [
        const CustomBackButton(),
        verticalMargin16,
        Text(
          categoryName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        verticalMargin12,
        SwitchCaseWidget<WidgetSwitchCase>(
          activeState: args.pageState,
          stateBuilder: (WidgetSwitchCase? activeState) {
            if (activeState is AppBarCase) {
              return const Text('App Bar');
            } else {
              return const Text('Default');
            }
          },
        ),
      ],
    );
  }
}
