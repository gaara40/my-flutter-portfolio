import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// The hero/landing section of the portfolio.
/// Displays name, role, and a brief introduction with CTA buttons.
/// Responsive: full-width on mobile, centered on desktop.
class HeroSection extends StatelessWidget {
  final VoidCallback? onViewProjects;
  final VoidCallback? onContactMe;

  const HeroSection({super.key, this.onViewProjects, this.onContactMe});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppTheme.spacingLG : AppTheme.spacingXXL,
          vertical: isMobile ? AppTheme.spacingXXL : 100,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppTheme.maxContentWidth,
            ),
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Accent line above name
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingLG),

                // Name
                Text(
                  'Pravin Palukuru',
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: AppTheme.spacingMD),

                // Role
                Text(
                  'Flutter Developer',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: AppTheme.spacingXL),

                // Intro text
                SizedBox(
                  width: isMobile ? double.infinity : 600,
                  child: Text(
                    'Mobile developer building cross-platform applications with Flutter.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.8,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXXL),

                // CTA Buttons
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton.icon(
                      onPressed: onViewProjects,
                      icon: const Icon(Icons.work_outline),
                      label: const Text('View Projects'),
                    ),
                    const SizedBox(width: AppTheme.spacingMD),
                    OutlinedButton.icon(
                      onPressed: onContactMe,
                      icon: const Icon(Icons.mail_outline),
                      label: const Text('Contact Me'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
