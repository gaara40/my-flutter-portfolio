import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

/// Root widget of the portfolio application.
/// Configures theme and calls the home page.
/// Responsibility: App setup ONLY.
class PortfolioApp extends StatelessWidget {
  const PortfolioApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pravin Palukuru',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
