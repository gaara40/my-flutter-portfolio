import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/section_heading.dart';

/// Contact section displaying email, LinkedIn, and GitHub links.
/// Simple, clean layout with clear CTAs for reaching out.
class ContactSection extends StatelessWidget {
  const ContactSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final year = DateTime.now().year;

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
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
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

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildContactMethod(
          context,
          Icons.email_outlined,
          'Email',
          'kumarpalukuru40@gmail.com',
          'mailto:kumarpalukuru40@gmail.com',
        ),
        _buildContactMethod(
          context,
          Icons.language,
          'LinkedIn',
          'linkedin.com/in/pravin-palukuru',
          'https://www.linkedin.com/in/pravin-palukuru',
        ),
        _buildContactMethod(
          context,
          Icons.code,
          'GitHub',
          'github.com/gaara40',
          'https://github.com/gaara40',
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactMethod(
          context,
          Icons.email_outlined,
          'Email',
          'hello@example.com',
          'mailto:hello@example.com',
        ),
        const SizedBox(height: AppTheme.spacingXXL),
        _buildContactMethod(
          context,
          Icons.language,
          'LinkedIn',
          'linkedin.com/in/yourname',
          'https://linkedin.com/in/yourname',
        ),
        const SizedBox(height: AppTheme.spacingXXL),
        _buildContactMethod(
          context,
          Icons.code,
          'GitHub',
          'github.com/yourname',
          'https://github.com/yourname',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Theme.of(context).primaryColor, size: 24),
              const SizedBox(width: AppTheme.spacingMD),
              Text(label, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        const SizedBox(height: AppTheme.spacingSM),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              // In a real app, use url_launcher
              // launchUrl(Uri.parse(url));
            },
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
