import 'package:flutter/material.dart';
import 'screens/main_shell.dart';
import 'theme/app_theme.dart';

/// Widget raiz do aplicativo.
class GeoFieldApp extends StatelessWidget {
  const GeoFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoField',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const MainShell(),
    );
  }
}