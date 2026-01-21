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

// My portfolio projects data
class ProjectData {
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: 'Snibbl – Poetry & Micro-Story Social Platform',
      description:
          'Snibbl is a Flutter-based social platform designed around short-form poetry and micro-stories.\n'
          'It supports user accounts and guest access, real-time content updates, and engagement features such as likes, comments, and saves.\n'
          'The project focuses on delivering a clean, distraction-free reading experience while handling dynamic content and user interaction.',

      technologies: [
        'Flutter',
        'Dart',
        'Firebase Authentication',
        'Cloud Firestore',
        'Firebase Cloud Messaging',
        'Riverpod',
      ],

      githubUrl: 'https://github.com/gaara40/snibbl',
      demoUrl: null,
      imageUrl: null,
    ),
    ProjectModel(
      title: 'QuickBill - Invoicing & Inventory Management App ',
      description:
          'QuickBill is a Flutter-based invoicing and inventory management application designed for small businesses and shop owners.\n'
          'The app supports inventory tracking, invoice generation, sales history, and business insights through a centralized dashboard.\n'
          'It focuses on handling structured business data, real-time updates, and persistent records using cloud-backed storage.',

      technologies: [
        'Flutter',
        'Dart',
        'Firebase Authentication',
        'Cloud Firestore',
        'Riverpod',
      ],

      githubUrl: 'https://github.com/gaara40/QuickBill',
      demoUrl: null,
      imageUrl: null,
    ),
    ProjectModel(
      title: 'Expense Tracker',
      description:
          'Expense Tracker is a Flutter application for recording and analyzing daily spending\n'
          'The app supports categorizing expenses, visualizing spending patterns, and managing records through sorting and editing features.\n'
          'It emphasizes local data persistence, responsive interactions, and a clean interface for handling personal finance data.',

      technologies: ['Flutter', 'Dart', 'Hive', 'Provider'],
      githubUrl: 'https://github.com/gaara40/ExpenseTracker',
      demoUrl: null,
      imageUrl: null,
    ),
  ];
}
