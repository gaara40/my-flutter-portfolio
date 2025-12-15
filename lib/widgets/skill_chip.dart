import 'package:flutter/material.dart';

/// A reusable chip widget for displaying skills or technology tags.
/// Uses theme colors to maintain consistency across the portfolio.
/// No business logic - purely presentational.
class SkillChip extends StatelessWidget {
  final String label;
  final bool isHighlighted;

  const SkillChip({required this.label, this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: isHighlighted
          ? Theme.of(context).primaryColor
          : Theme.of(context).colorScheme.surface,
      labelStyle: TextStyle(
        color: isHighlighted
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide(
        color: isHighlighted
            ? Colors.transparent
            : Theme.of(context).primaryColor.withOpacity(0.3),
      ),
    );
  }
}
