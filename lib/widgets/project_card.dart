import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../theme/app_theme.dart';
import 'skill_chip.dart';

/// A reusable card widget for displaying individual projects.
/// Takes a ProjectModel and renders all project information.
/// Handles navigation to GitHub and demo links.
class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingLG),
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
          // Project Title
          Text(project.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AppTheme.spacingMD),

          // Project Description
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppTheme.spacingLG),

          // Technologies
          Wrap(
            spacing: AppTheme.spacingSM,
            runSpacing: AppTheme.spacingSM,
            children: project.technologies
                .map((tech) => SkillChip(label: tech))
                .toList(),
          ),
          const SizedBox(height: AppTheme.spacingLG),

          // Buttons
          Wrap(
            spacing: AppTheme.spacingMD,
            runSpacing: AppTheme.spacingMD,
            children: [
              if (project.githubUrl != null)
                SizedBox(
                  height: 44,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // In a real app, use url_launcher package
                      // launchUrl(Uri.parse(project.githubUrl!));
                    },
                    icon: const Icon(Icons.code),
                    label: const Text('GitHub'),
                  ),
                ),
              if (project.demoUrl != null)
                SizedBox(
                  height: 44,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // In a real app, use url_launcher package
                      // launchUrl(Uri.parse(project.demoUrl!));
                    },
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('Demo'),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
