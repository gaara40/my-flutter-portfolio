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
        horizontal: isMobile ? AppTheme.spacingL : AppTheme.spacingXXL,
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
        'I’m a mobile developer working primarily with Flutter and Android, with a strong focus on clean user interfaces and practical, well-structured code. I enjoy taking features from idea to implementation, working through UI details, API integration, and edge cases that show up in real usage.',

        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const SizedBox(height: AppTheme.spacingL),
      Text(
        'I care about how applications hold up over time, not just how quickly features are implemented. Maintainability, performance, and clarity guide the way I write code, with close attention to edge cases and long-term usability. I’m comfortable working within existing codebases and structuring features so they remain easy to understand, test, and extend as the product grows.',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      // const SizedBox(height: AppTheme.spacingL),
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
