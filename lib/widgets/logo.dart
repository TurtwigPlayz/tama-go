import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/providers/theme_provider.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ColorFiltered(
        key: ValueKey(theme.themeMode),
        colorFilter: theme.themeMode == ThemeMode.dark
            ? const ColorFilter.matrix(<double>[
                -1, 0, 0, 0, 255, // Red
                0, -1, 0, 0, 255, // Green
                0, 0, -1, 0, 255, // Blue
                0, 0, 0, 1, 0, // Alpha
              ])
            : const ColorFilter.matrix(<double>[
                1, 0, 0, 0, 0, // Red
                0, 1, 0, 0, 0, // Green
                0, 0, 1, 0, 0, // Blue
                0, 0, 0, 1, 0, // Alpha
              ]),
        child: Image.asset(
          'images/logo.png',
          height: clampDouble(MediaQuery.of(context).size.height * 0.1, 65, 75),
        ),
      ),
    );
  }
}
