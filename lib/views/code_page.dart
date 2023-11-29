import 'package:flutter/material.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/layout/responsive_layout_builder.dart';
import 'package:flutteri/routes/code_screen_argument.dart';
import 'package:flutteri/widgets/navbar.dart';
import 'package:flutteri/widgets/sandbox.dart';
import 'package:go_router/go_router.dart';

class MyCodePage extends StatefulWidget {
  const MyCodePage({required this.args, super.key});

  final CodeScreenArgument args;

  @override
  State<MyCodePage> createState() => _MyCodePageState();
}

class _MyCodePageState extends State<MyCodePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 1,
    );
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
    final components = widget.args.components;
    final categoryName = widget.args.categoryName;
    return Padding(
      padding: padding,
      child: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: components.length,
            itemBuilder: (context, index) {
              return CodeSandBox(
                tabController: _tabController,
                model: components[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => context.pop(),
          child: const Icon(
            Icons.arrow_back,
            size: 16,
            color: Colors.blue,
          ),
        ),
        horizontalMargin4,
        InkWell(
          onTap: () => context.pop(),
          child: Text(
            'Back to all components',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.blue,
                ),
          ),
        ),
      ],
    );
  }
}
