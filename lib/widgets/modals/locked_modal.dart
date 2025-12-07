import 'dart:ui';

import 'package:flutter/material.dart';

class LockedModal extends StatelessWidget {
  const LockedModal({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 7.0,
          horizontal: 2.0,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300.0),
          child: Text(message,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: clampDouble(
                        MediaQuery.of(context).size.width * 0.01, 14, 16),
                  )),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
