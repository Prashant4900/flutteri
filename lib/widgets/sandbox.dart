import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutteri/constants/common.dart';
import 'package:flutteri/models/type_model.dart';
import 'package:flutteri/theme/code_preview_theme.dart';
import 'package:url_launcher/url_launcher.dart';

const String _markDownData = r'''
// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
''';

class CodeSandBox extends StatelessWidget {
  const CodeSandBox({
    required TabController tabController,
    required this.model,
    super.key,
  }) : _tabController = tabController;

  final TabController _tabController;
  final TypeModel model;

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
                model.title!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
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
                  controller: _tabController,
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
          height: 500,
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
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            children: [
              const Text('data'),
              ColoredBox(
                color: const Color(0xff141517),
                child: SingleChildScrollView(
                  padding: horizontalPadding24,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          verticalMargin24,
                          GestureDetector(
                            onVerticalDragStart: (_) {},
                            child: HighlightView(
                              _markDownData,
                              language: 'dart',
                              theme: androidStudioTheme,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(
                            Uri.parse(
                              'https://dartpad.dev/?id=${model.gistId}',
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
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            try {
                              Clipboard.setData(
                                const ClipboardData(
                                  text: _markDownData,
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
                          icon: const Icon(Icons.copy),
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
