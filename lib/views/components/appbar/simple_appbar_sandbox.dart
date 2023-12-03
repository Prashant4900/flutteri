import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/theme/code_preview_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCodeSandBox extends StatefulWidget {
  const MyCodeSandBox({
    required this.widget,
    required this.title,
    required this.code,
    required this.minHeight,
    required this.maxHeight,
    super.key,
  });

  final Widget widget;
  final String title;
  final double minHeight;
  final double maxHeight;
  final String code;

  @override
  State<MyCodeSandBox> createState() => _MyCodeSandBoxState();
}

class _MyCodeSandBoxState extends State<MyCodeSandBox>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  // int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   _controller.addListener(() {
  //     setState(() {
  //       _currentIndex = _controller.index;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          padding: horizontalPadding16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              // Text(_currentIndex.toString()),
              Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  padding:
                      horizontalPadding4 + verticalPadding4 + verticalPadding2,
                  labelPadding: EdgeInsets.zero,
                  controller: _controller,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  labelColor: Theme.of(context).colorScheme.surface,
                  unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: 'Preview'),
                    Tab(text: 'Code'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: _controller.index == 0 ? widget.minHeight : widget.maxHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(.3),
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            children: [
              Center(child: widget.widget),
              ColoredBox(
                color: const Color(0xff141517),
                child: Padding(
                  padding: horizontalPadding24 + topPadding8,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          verticalMargin24,
                          GestureDetector(
                            onVerticalDragStart: (_) {},
                            child: HighlightView(
                              widget.code,
                              language: 'dart',
                              theme: androidStudioTheme,
                              padding: topPadding12,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(
                            Uri.parse(
                              'https://dartpad.dev/?id={model.gistId}',
                            ),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Padding(
                          padding: topPadding4,
                          child: Text(
                            'View complete example on DartPad.',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            try {
                              Clipboard.setData(
                                ClipboardData(
                                  text: widget.code,
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Copied to clipboard'),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Something went wrong.'),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.copy,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
