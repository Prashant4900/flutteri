import 'package:flutter/material.dart';
import 'package:flutteri/constants/common.dart';

class BoxIconButton extends StatelessWidget {
  const BoxIconButton({
    required this.icon,
    super.key,
    this.onTap,
  });

  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: allPadding4 + allPadding2,
        child: icon,
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.onTap,
  });

  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: horizontalPadding16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              Icon(prefixIcon, size: 16),
              horizontalMargin12,
            ],
            Text(
              label ?? 'Button',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
              textAlign: TextAlign.center,
            ),
            if (suffixIcon != null) ...[
              horizontalMargin12,
              Icon(suffixIcon, size: 16),
            ],
          ],
        ),
      ),
    );
  }
}
