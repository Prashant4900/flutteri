import 'package:flutter/material.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/gen/assets.gen.dart';
import 'package:flutteri/layout/responsive/responsive_layout_builder.dart';
import 'package:flutteri/layout/switch/switch_case_widget.dart';
import 'package:flutteri/models/component_model.dart';
import 'package:flutteri/routes/component_page_args.dart';
import 'package:flutteri/routes/routes.dart';
import 'package:flutteri/views/widgets/navbar.dart';
import 'package:go_router/go_router.dart';

final categoryList = <CategoryModel>[
  CategoryModel(id: 0, name: 'App Bar', widgetSwitchCase: AppBarCase()),
  CategoryModel(id: 1, name: 'Banner', widgetSwitchCase: BannerCase()),
  CategoryModel(id: 2, name: 'Buttons', widgetSwitchCase: ButtonCase()),
  CategoryModel(id: 3, name: 'Cards', widgetSwitchCase: CardsCase()),
  CategoryModel(id: 4, name: 'Footer', widgetSwitchCase: FooterCase()),
  CategoryModel(id: 5, name: 'TextField', widgetSwitchCase: TextFieldCase()),
  CategoryModel(id: 6, name: 'Slider', widgetSwitchCase: SliderCase()),
  CategoryModel(id: 7, name: 'Checkbox', widgetSwitchCase: CheckBoxCase()),
  CategoryModel(
    id: 8,
    name: 'Radio Button',
    widgetSwitchCase: RadioButtonsCase(),
  ),
];

class MyCategoryPage extends StatefulWidget {
  const MyCategoryPage({super.key});

  @override
  State<MyCategoryPage> createState() => _MyCategoryPageState();
}

class _MyCategoryPageState extends State<MyCategoryPage> {
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
                padding: horizontalPadding12 + verticalPadding12,
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
            if (layoutSize == ResponsiveLayoutSize.small) {
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ComponentsCardWidget(
                    widgetSwitchCase: categoryList[index].widgetSwitchCase!,
                    name: categoryList[index].name!,
                  );
                },
                separatorBuilder: (context, index) {
                  return verticalMargin12;
                },
                itemCount: categoryList.length,
                shrinkWrap: true,
              );
            } else {
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (var i = 0; i < categoryList.length; i++)
                    ComponentsCardWidget(
                      widgetSwitchCase: categoryList[i].widgetSwitchCase!,
                      name: categoryList[i].name!,
                    ),
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
    required this.name,
    required this.widgetSwitchCase,
    super.key,
  });

  final String name;
  final WidgetSwitchCase widgetSwitchCase;

  @override
  State<ComponentsCardWidget> createState() => _ComponentsCardWidgetState();
}

class _ComponentsCardWidgetState extends State<ComponentsCardWidget> {
  double width = 450;
  double height = 350;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
        return InkWell(
          onTap: () => context.goNamed(
            RoutePath.components.name,
            pathParameters: {'slug': widget.name.toSlug},
            extra: ComponentPageArgs(
              categoryName: widget.name,
              pageState: widget.widgetSwitchCase,
            ),
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.surface.withOpacity(.3),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Assets.components.button.svg(
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                ListTile(
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    '0 Components',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
