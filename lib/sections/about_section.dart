import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/section_heading.dart';

/// About section displaying professional summary, experience, and technologies.
/// Clean, readable layout with proper spacing and typography.
class AboutSection extends StatelessWidget {
  const AboutSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.spacingLG : AppTheme.spacingXXL,
        vertical: AppTheme.spacingXXL,
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                title: 'About Me',
                subtitle: 'A brief introduction to my professional journey',
              ),
              const SizedBox(height: AppTheme.spacingXL),

              // Content in two columns on desktop, single column on mobile
              isMobile
                  ? _buildMobileLayout(context)
                  : _buildDesktopLayout(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildContent(context),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [..._buildContent(context)],
    );
  }

  List<Widget> _buildContent(BuildContext context) {
    return [
      Text(
        'I’m a mobile developer working primarily with Flutter and Android, focused on building clean, reliable, and user-friendly applications. I enjoy working across the full development flow from designing responsive UI to integrating APIs and cloud-backed features.',

        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const SizedBox(height: AppTheme.spacingLG),
      Text(
        'My interest in development started with curiosity about how products are built and scaled. Over time, I’ve worked on real-world applications where maintainability, performance, and collaboration matter just as much as features. I value writing clear code, thinking through edge cases, and building things that are easy to evolve over time.',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      // const SizedBox(height: AppTheme.spacingLG),
      // Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Text(
      //       '2+ ',
      //       style: Theme.of(context).textTheme.displaySmall?.copyWith(
      //         color: Theme.of(context).primaryColor,
      //       ),
      //     ),
      //     Text(
      //       'years of experience',
      //       style: Theme.of(context).textTheme.headlineSmall,
      //     ),
      //   ],
      // ),
    ];
  }
}
