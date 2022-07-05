import 'package:flutter/material.dart';

import '../theme/custom_theme.dart';

class ToggleThemeWidget extends StatefulWidget {
  const ToggleThemeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ToggleThemeWidget> createState() => _ToggleThemeWidgetState();
}

class _ToggleThemeWidgetState extends State<ToggleThemeWidget> {
  @override
  void initState() {
    CustomTheme().addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CustomTheme().toggleTheme();
      },
      icon: Icon(
        CustomTheme().themeMode == ThemeMode.dark
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
    );
  }
}
