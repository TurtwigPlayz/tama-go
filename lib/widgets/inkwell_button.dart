import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/widgets/modals/message_modal.dart';

class InkwellButton extends StatelessWidget {
  const InkwellButton({
    super.key,
    required this.onTap,
    this.title,
    this.icon,
    this.padding = 10.0,
    this.iconSize = 20.0,
    this.borderRadius = 10.0,
    this.splashColor,
    this.isDisabled = false,
    this.disabledMessage = 'This button is disabled',
  });

  final VoidCallback onTap;
  final String? title;
  final IconData? icon;
  final Color? splashColor;
  final double padding;
  final double iconSize;
  final double borderRadius;
  final bool isDisabled;
  final String disabledMessage;

  void _handleTap(BuildContext context) {
    if (isDisabled) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => MessageModal(
          message: disabledMessage,
        ),
      );
    } else {
      onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    final color =
        splashColor != null ? splashColor! : Theme.of(context).iconTheme.color!;

    final borderRadius = this.borderRadius *
        clampDouble(MediaQuery.of(context).size.width * 0.001, 1.0, 1.3);

    const double disabledOpacity = 0.65;

    return Material(
      color: isDisabled
          ? Theme.of(context).shadowColor.withOpacity(disabledOpacity)
          : Theme.of(context).shadowColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        splashColor:
            isDisabled ? color.withOpacity(0.1) : color.withOpacity(0.75),
        onTap: () => _handleTap(context),
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (icon != null)
                Icon(
                  icon,
                  size: iconSize *
                      clampDouble(
                        MediaQuery.of(context).size.width * 0.0015,
                        0.7,
                        1.5,
                      ),
                  color:
                      isDisabled ? color.withOpacity(disabledOpacity) : color,
                ),
              if (title != null) ...<Widget>[
                const SizedBox(width: 10.0),
                Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: isDisabled
                            ? color.withOpacity(disabledOpacity)
                            : color,
                        fontSize: clampDouble(
                          MediaQuery.of(context).size.width * 0.015,
                          12.0,
                          16.0,
                        ),
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
