import 'package:flutter/material.dart';

import 'core/theme/custom_theme.dart';
import 'presentation/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    CustomTheme().addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mark Cabalona',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().lightTheme,
      darkTheme: CustomTheme().darkTheme,
      themeMode: CustomTheme().themeMode,
      home: const HomePage(),
    );
  }
}
