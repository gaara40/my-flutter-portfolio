import 'package:flutter/material.dart';
import 'package:portfolio/helpers/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/section_heading.dart';

/// Resume section with download button and optional PDF viewer placeholder.
/// Clean, minimal design focusing on the call-to-action.
class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final pdfUrl =
        'https://raw.githubusercontent.com/gaara40/my-flutter-portfolio/31039aa92164d27457d27e69139d09bbb9df6cc9/assets/pdf/Pravinkumar_Resume1.pdf';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.spacingL : AppTheme.spacingXXL,
        vertical: AppTheme.spacingXXL,
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                title: 'Resume',
                subtitle: 'Download my CV or view my professional details',
              ),
              const SizedBox(height: AppTheme.spacingXXL),

              // Resume content container
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingXXL),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Download My Resume',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      'Get a comprehensive overview of my professional experience, education, and key accomplishments.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: AppTheme.spacingXL),

                    // Download button
                    ElevatedButton.icon(
                      onPressed: () {
                        urlLauncher(pdfUrl);
                      },
                      icon: const Icon(Icons.download),
                      label: const Text('Download Resume (PDF)'),
                    ),
                    const SizedBox(height: AppTheme.spacingXXL),

                    // Divider
                    Divider(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      height: AppTheme.spacingXXL,
                    ),
                    const SizedBox(height: AppTheme.spacingXXL),

                    // Quick facts
                    Text(
                      'Quick Facts',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: AppTheme.spacingL),
                    _buildQuickFact(
                      context,
                      'Experience',
                      '2+ years in Flutter & Android development',
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    _buildQuickFact(
                      context,
                      'Education',
                      'Bachelor\'s in Information Technology',
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    _buildQuickFact(
                      context,
                      'Specialization',
                      'Mobile & Cross-Platform App Development',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickFact(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(label, style: Theme.of(context).textTheme.labelLarge),
        ),
        Expanded(
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
