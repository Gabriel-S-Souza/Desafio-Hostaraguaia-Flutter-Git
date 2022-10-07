import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    required this.color,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
