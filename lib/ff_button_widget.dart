import 'package:flutter/material.dart';

class FFButtonOptions {
  const FFButtonOptions({
    this.width,
    this.height,
    this.padding,
    this.iconPadding,
    this.color,
    this.textStyle,
    this.elevation,
    this.borderRadius,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? iconPadding;
  final Color? color;
  final TextStyle? textStyle;
  final double? elevation;
  final BorderRadius? borderRadius;
}

class FFButtonWidget extends StatelessWidget {
  const FFButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    required this.options,
  });

  final VoidCallback onPressed;
  final String text;
  final Widget? icon;
  final FFButtonOptions options;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(options.width ?? 0, options.height ?? 0),
        padding: options.padding,
        backgroundColor: options.color,
        textStyle: options.textStyle,
        elevation: options.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: options.borderRadius ?? BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: options.iconPadding ?? EdgeInsets.zero,
              child: icon!,
            ),
          Text(text),
        ],
      ),
    );
  }
}