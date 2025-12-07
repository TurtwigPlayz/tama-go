import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';

class IconInkwellButton extends StatelessWidget {
  const IconInkwellButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.splashColor,
    this.iconSize = 15,
  });

  final VoidCallback onTap;
  final IconData icon;
  final Color? splashColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    const double iconBorderRadius = 20.0;
    const double iconPadding = 7.0;

    return InkwellButton(
      onTap: onTap,
      icon: icon,
      splashColor: splashColor,
      borderRadius: iconBorderRadius,
      padding: iconPadding,
      iconSize: iconSize,
    );
  }
}
