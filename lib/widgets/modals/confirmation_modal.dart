import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';

class ConfirmationModal extends StatelessWidget {
  const ConfirmationModal({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
  });

  final String title;
  final String message;
  final VoidCallback onConfirm;

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
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: clampDouble(
                    MediaQuery.of(context).size.width * 0.01, 16, 20),
              ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: InkwellButton(
                title: 'Confirm',
                onTap: () => {
                  Navigator.of(context).pop(),
                  onConfirm(),
                },
                icon: Icons.check,
                splashColor: greenColor,
              ),
            ),
            const SizedBox(width: 8.0), // Add some spacing between the buttons
            Expanded(
              child: InkwellButton(
                title: 'Cancel',
                onTap: () => Navigator.of(context).pop(),
                icon: Icons.close,
                splashColor: redColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
