import 'dart:ui';
import 'package:flutter/material.dart';

class TaggedText extends StatelessWidget {
  const TaggedText({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.textColor,
  });

  final String text;
  final Color backgroundColor;

  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: const Color(0xFF4F4F4F),
                fontSize: clampDouble(
                    MediaQuery.of(context).size.width * 0.01, 12, 14),
              ),
        ),
      ),
    );
  }
}
