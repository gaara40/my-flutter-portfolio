import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A reusable heading widget for portfolio sections.
/// Ensures consistent typography and spacing across all sections.
class SectionHeading extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionHeading({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.displaySmall),
        if (subtitle != null) ...[
          const SizedBox(height: AppTheme.spacingXS),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}
