import 'package:flutter/material.dart';

part 'switch_case_components.dart';

class SwitchCaseWidget<T> extends StatelessWidget {
  const SwitchCaseWidget({
    required this.stateBuilder,
    required this.activeState,
    super.key,
  });
  final Widget? Function(T? t) stateBuilder;
  final T activeState;

  @override
  Widget build(BuildContext context) {
    return stateBuilder(activeState) ?? const SizedBox.shrink();
  }
}
