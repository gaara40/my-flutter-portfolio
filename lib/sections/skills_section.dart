import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/section_heading.dart';
import '../widgets/skill_chip.dart';

/// Skills section displaying developer skills grouped by category.
/// Uses reusable SkillChip widgets for consistent styling.
class SkillsSection extends StatelessWidget {
  const SkillsSection();

  // Skills list - easy to update
  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Kotlin',
    'Android Development',
    'Riverpod',
    'Provider',
    'REST APIs',
    'Dio',
    'Volley',
    'Firebase Ecosystem',
    'Hive',
    'SQL',
    'Git',
    'GitHub',
    'Android Studio',
    'VS Code',
    'Postman',
    'Unit Testing',
    'Mockito',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 768
            ? AppTheme.spacingLG
            : AppTheme.spacingXXL,
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
                title: 'Skills & Expertise',
                subtitle: 'Technologies and tools I work with daily',
              ),
              const SizedBox(height: AppTheme.spacingXXL),
              // Flat list of all skills
              Wrap(
                spacing: AppTheme.spacingMD,
                runSpacing: AppTheme.spacingMD,
                children: skills
                    .map(
                      (skill) => SkillChip(label: skill, isHighlighted: false),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
