/// Represents a portfolio project with metadata.
/// Used to render projects in the projects section without hardcoding UI.
class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? demoUrl;
  final String? imageUrl;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.demoUrl,
    this.imageUrl,
  });
}

/// Sample projects for the portfolio.
/// Replace with your own projects.
class ProjectData {
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: 'Snibbl - Poetry & Micro-Story Social Platform',
      description:
          'A creative social platform for poets and micro-storytellers to share their work. \nFeatures email/password and Google Sign-In authentication, guest login mode for casual readers, real-time poem feed with likes, comments, and saves. \nIntegrated push notifications alert users when their posts receive engagement.',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase Auth',
        'Firestore',
        'Cloud Messaging',
        'Riverpod',
      ],
      githubUrl: 'https://github.com/yourname/snibbl',
      demoUrl: null,
      imageUrl: null,
    ),
    ProjectModel(
      title: 'QuickBill - Invoicing & Inventory Management App ',
      description:
          'An intuitive invoicing and inventory management app designed for small business owners. \nGenerates professional invoices with customer details and auto-calculated totals, manages stock in real-time, and provides a comprehensive sales dashboard. \nFirebase integration ensures data persistence and accessibility across devices.',
      technologies: [
        'Flutter',
        'Dart',
        'Riverpod',
        'Firebase',
        'Firestore',
        'Cloud Storage',
      ],
      githubUrl: 'https://github.com/yourname/quickbill',
      demoUrl: null,
      imageUrl: null,
    ),
    ProjectModel(
      title: 'Expense Tracker',
      description:
          'A beautifully designed expense tracking app with intuitive category management and visual spending insights. \nFeatures local data persistence using Hive, category-wise bar charts for analysis, multiple sort options, and undo functionality for accidental deletions. \nMinimal UI focuses on clarity and ease of use.',
      technologies: ['Flutter', 'Dart', 'Hive', 'Provider', 'Material Design'],
      githubUrl: 'https://github.com/yourname/expense-tracker',
      demoUrl: null,
      imageUrl: null,
    ),
  ];
}
