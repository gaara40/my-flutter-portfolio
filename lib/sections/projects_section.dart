import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/section_heading.dart';
import '../widgets/project_card.dart';
import '../models/project_model.dart';

/// Projects section displaying portfolio projects using ProjectCard widgets.
/// Uses ProjectData to manage project information separate from UI.
/// Responsive grid that adapts to screen size.
class ProjectsSection extends StatelessWidget {
   const ProjectsSection({super.key});

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
                title: 'Projects',
                subtitle: 'Work that showcases my skills and passion',
              ),
              const SizedBox(height: AppTheme.spacingXL),

              // Responsive grid of projects
              isMobile ? _buildMobileGrid(context) : _buildDesktopGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Desktop layout: 2 columns
  Widget _buildDesktopGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppTheme.spacingLG,
        mainAxisSpacing: AppTheme.spacingLG,
        childAspectRatio: 1.0,
      ),
      itemCount: ProjectData.projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: ProjectData.projects[index]);
      },
    );
  }

  /// Mobile layout: 1 column
  Widget _buildMobileGrid(BuildContext context) {
    return Column(
      children: List.generate(
        ProjectData.projects.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: AppTheme.spacingLG),
          child: ProjectCard(project: ProjectData.projects[index]),
        ),
      ),
    );
  }
}
