import 'package:flutter/material.dart';
import 'package:portfolio/helpers/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/section_heading.dart';

/// Contact section displaying email, LinkedIn, and GitHub links.
/// Simple, clean layout with clear CTAs for reaching out.
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final year = DateTime.now().year;

    final emailUrl = 'mailto:kumarpalukuru40@gmail.com';
    final linkedInUrl = 'https://www.linkedin.com/in/pravin-palukuru';
    final githubUrl = 'https://github.com/gaara40';

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
                title: 'Get In Touch',
                subtitle:
                    'Feel free to reach out for collaborations or just a friendly hello!',
              ),
              const SizedBox(height: AppTheme.spacingXXL),

              // Contact info container
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingXXL),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                ),
                child: isMobile
                    ? _buildMobileLayout(
                        context,
                        emailUrl,
                        linkedInUrl,
                        githubUrl,
                      )
                    : _buildDesktopLayout(
                        context,
                        emailUrl,
                        linkedInUrl,
                        githubUrl,
                      ),
              ),

              const SizedBox(height: AppTheme.spacingXXL),

              // Footer text
              Center(
                child: Text(
                  '© $year Pravin Palukuru. Crafted with Flutter.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    String emailUrl,
    String linkedInUrl,
    String githubUrl,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildContactMethod(
          context,
          Icons.email_outlined,
          'Email',
          'kumarpalukuru40@gmail.com',
          emailUrl,
        ),
        _buildContactMethod(
          context,
          Icons.language,
          'LinkedIn',
          'linkedin.com/in/pravin-palukuru',
          linkedInUrl,
        ),
        _buildContactMethod(
          context,
          Icons.code,
          'GitHub',
          'github.com/gaara40',
          githubUrl,
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    String emailUrl,
    String linkedInUrl,
    String githubUrl,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildContactMethod(
          context,
          Icons.email_outlined,
          'Email',
          'kumarpalukuru40@gmail.com',
          emailUrl,
        ),
        const SizedBox(height: AppTheme.spacingXXL),
        _buildContactMethod(
          context,
          Icons.language,
          'LinkedIn',
          'linkedin.com/in/pravin-palukuru',
          linkedInUrl,
        ),
        const SizedBox(height: AppTheme.spacingXXL),
        _buildContactMethod(
          context,
          Icons.code,
          'GitHub',
          'github.com/gaara40',
          githubUrl,
        ),
      ],
    );
  }

  Widget _buildContactMethod(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    String url,
  ) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Theme.of(context).primaryColor, size: 22),
              const SizedBox(width: 10),
              Text(label, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(height: AppTheme.spacingS),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => urlLauncher(url),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
