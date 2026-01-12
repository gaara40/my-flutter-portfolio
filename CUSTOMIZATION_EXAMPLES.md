# 📖 Common Customization Examples

Quick copy-paste examples for common portfolio customizations.

---

## 🎯 Hero Section - Your Introduction

**File**: `lib/sections/hero_section.dart`

### Example 1: Frontend Focus
```dart
Text(
  'Jane Anderson',
  style: Theme.of(context).textTheme.displayLarge,
),
const SizedBox(height: AppTheme.spacingM),
Text(
  'React & Web Developer',
  style: Theme.of(context).textTheme.displaySmall?.copyWith(
    color: Theme.of(context).primaryColor,
    fontWeight: FontWeight.w600,
  ),
),
const SizedBox(height: AppTheme.spacingXL),
SizedBox(
  width: isMobile ? double.infinity : 600,
  child: Text(
    'I create beautiful, responsive web applications using React and modern JavaScript. Passionate about user experience and clean, maintainable code.',
    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
      height: 1.8,
      color: Theme.of(context).colorScheme.onSurface,
    ),
    textAlign: isMobile ? TextAlign.center : TextAlign.left,
  ),
),
```

### Example 2: Full-Stack Developer
```dart
Text(
  'Alex Chen',
  style: Theme.of(context).textTheme.displayLarge,
),
const SizedBox(height: AppTheme.spacingM),
Text(
  'Full-Stack Developer',
  style: Theme.of(context).textTheme.displaySmall?.copyWith(
    color: Theme.of(context).primaryColor,
  ),
),
const SizedBox(height: AppTheme.spacingXL),
SizedBox(
  width: isMobile ? double.infinity : 600,
  child: Text(
    'Building end-to-end solutions from frontend to backend. Specializing in Node.js, React, and cloud infrastructure. 7+ years transforming ideas into scalable applications.',
    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
    textAlign: isMobile ? TextAlign.center : TextAlign.left,
  ),
),
```

---

## 📚 About Section - Your Story

**File**: `lib/sections/about_section.dart`

### Example: Different Background
```dart
List<Widget> _buildContent(BuildContext context) {
  return [
    Text(
      'I transitioned to tech from a design background, bringing a unique perspective to problem-solving. My journey has been about continuous learning and building products that users love.',
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    const SizedBox(height: AppTheme.spacingL),
    Text(
      'What started as learning to code for fun evolved into a passion for building mobile applications. I\'ve worked with startups in fintech, healthcare, and e-commerce, always focusing on delivering quality software.',
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    const SizedBox(height: AppTheme.spacingL),
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '50+ ',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          'apps shipped',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    ),
  ];
}

Widget _buildTechStack(BuildContext context) {
  final categories = {
    'Languages': ['Dart', 'JavaScript', 'TypeScript', 'Python'],
    'Mobile': ['Flutter', 'Android Native', 'iOS Native'],
    'Web': ['React', 'Next.js', 'Vue.js', 'HTML/CSS'],
    'Backend': ['Node.js', 'Firebase', 'Supabase', 'MongoDB'],
  };

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: categories.entries.map((entry) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.key,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            entry.value.join(', '),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppTheme.spacingL),
        ],
      );
    }).toList(),
  );
}
```

---

## 🎯 Skills Section - Your Expertise

**File**: `lib/sections/skills_section.dart`

### Example: Design + Development
```dart
static const Map<String, List<String>> skillsByCategory = {
  'Design': [
    'UI/UX Design',
    'Figma',
    'Design Systems',
    'Responsive Design',
    'Wireframing',
  ],
  'Frontend': [
    'React',
    'TypeScript',
    'Tailwind CSS',
    'Next.js',
    'Performance Optimization',
  ],
  'Development': [
    'Flutter',
    'Dart',
    'Firebase',
    'State Management',
    'Testing',
  ],
  'Tools': [
    'Git & GitHub',
    'VS Code',
    'DevTools',
    'Figma',
    'Jira',
  ],
};
```

### Example: Data Science
```dart
static const Map<String, List<String>> skillsByCategory = {
  'Programming': [
    'Python',
    'SQL',
    'R',
    'JavaScript',
    'Scala',
  ],
  'ML/AI': [
    'TensorFlow',
    'PyTorch',
    'Scikit-learn',
    'NLP',
    'Computer Vision',
  ],
  'Data Engineering': [
    'Apache Spark',
    'Hadoop',
    'PostgreSQL',
    'Big Query',
    'Data Pipelines',
  ],
  'Cloud & Tools': [
    'GCP',
    'AWS',
    'Docker',
    'Jupyter',
    'Git',
  ],
};
```

---

## 🎨 Projects - Your Work

**File**: `lib/models/project_model.dart`

### Example: AI/ML Project
```dart
ProjectModel(
  title: 'Predictive Analytics Dashboard',
  description:
      'Real-time dashboard for predicting customer churn using machine learning. Achieved 87% accuracy with ensemble models.',
  technologies: ['Python', 'TensorFlow', 'React', 'PostgreSQL', 'Docker'],
  githubUrl: 'https://github.com/yourname/churn-prediction',
  demoUrl: 'https://churn-dashboard.example.com',
),
```

### Example: Mobile App
```dart
ProjectModel(
  title: 'Habit Tracker App',
  description:
      'Mobile app helping users build positive habits with daily reminders, analytics, and social challenges.',
  technologies: ['Flutter', 'Firebase', 'Riverpod', 'Local Storage'],
  githubUrl: 'https://github.com/yourname/habit-tracker',
  demoUrl: null, // No live demo for mobile apps typically
),
```

### Example: SaaS Product
```dart
ProjectModel(
  title: 'Task Collaboration Platform',
  description:
      'SaaS tool for remote teams to manage projects. Features real-time collaboration, time tracking, and team analytics.',
  technologies: ['React', 'Node.js', 'PostgreSQL', 'Socket.io', 'Stripe'],
  githubUrl: null,
  demoUrl: 'https://taskflow.example.com',
),
```

### Example: Open Source
```dart
ProjectModel(
  title: 'Flutter State Management Package',
  description:
      'Popular open-source Dart package with 10k+ weekly downloads. Simplifies complex state management patterns.',
  technologies: ['Dart', 'Flutter', 'Pub.dev'],
  githubUrl: 'https://github.com/yourname/state-pkg',
  demoUrl: 'https://pub.dev/packages/your_package',
),
```

---

## 📄 Resume Section - Your Background

**File**: `lib/sections/resume_section.dart`

### Example: Multiple Roles
```dart
_buildQuickFact(
  context,
  'Experience',
  'Senior Developer (3y), Mid Developer (2y), Junior Developer (1y)',
),
const SizedBox(height: AppTheme.spacingM),
_buildQuickFact(
  context,
  'Education',
  'BS Computer Science, Online Certifications (Google, Coursera)',
),
const SizedBox(height: AppTheme.spacingM),
_buildQuickFact(
  context,
  'Specialization',
  'Full-stack development, Performance optimization, System design',
),
const SizedBox(height: AppTheme.spacingM),
_buildQuickFact(
  context,
  'Companies',
  'Startup (Series B), Scale-up, Enterprise',
),
```

### Example: Non-Traditional Path
```dart
_buildQuickFact(
  context,
  'Experience',
  'Self-taught Developer (5+ years building products)',
),
const SizedBox(height: AppTheme.spacingM),
_buildQuickFact(
  context,
  'Background',
  'Physics → Self-taught → Professional Developer',
),
const SizedBox(height: AppTheme.spacingM),
_buildQuickFact(
  context,
  'Focus',
  'Problem-solving, User-centric design, Clean code',
),
const SizedBox(height: AppTheme.spacingM),
_buildQuickFact(
  context,
  'Contributions',
  '100+ GitHub repos, Active open-source contributor',
),
```

---

## 📧 Contact Section - Your Channels

**File**: `lib/sections/contact_section.dart`

### Example: Developer with Blog
```dart
@override
Widget _buildContactMethod(
  BuildContext context,
  IconData icon,
  String label,
  String value,
  String url,
) {
  // ... existing code ...
}

// In _buildDesktopLayout or _buildMobileLayout, add:
_buildContactMethod(
  context,
  Icons.article_outlined,
  'Blog',
  'blog.example.com',
  'https://blog.example.com',
),
```

### Example: Designer Contact
```dart
_buildContactMethod(
  context,
  Icons.image_outlined,
  'Portfolio',
  'behance.net/yourname',
  'https://behance.net/yourname',
),
_buildContactMethod(
  context,
  Icons.email_outlined,
  'Email',
  'hello@example.com',
  'mailto:hello@example.com',
),
_buildContactMethod(
  context,
  Icons.language,
  'Twitter',
  'twitter.com/yourname',
  'https://twitter.com/yourname',
),
```

---

## 🎨 Changing Theme Colors

**File**: `lib/theme/app_theme.dart`

### Example: Purple Accent
```dart
static const Color _accentColor = Color(0xFF9C27B0);  // Purple
```

### Example: Green Accent
```dart
static const Color _accentColor = Color(0xFF4CAF50);  // Green
```

### Example: Orange Accent
```dart
static const Color _accentColor = Color(0xFFFF9800);  // Orange
```

### Example: Lighter Dark Mode
```dart
static const Color _bgPrimary = Color(0xFF1A1A1A);
static const Color _bgSecondary = Color(0xFF2D2D2D);
static const Color _accentColor = Color(0xFF6BCAFF);  // Light Blue
```

---

## ✨ Pro Tips

### Add Icons to Skills
```dart
// In skills_section.dart, create a mapping
const skillIcons = {
  'Flutter': Icons.flutter_dash,
  'React': Icons.language,
  'Python': Icons.code,
  // ...
};
```

### Add Animations
```dart
// Replace static Container with TweenAnimationBuilder
TweenAnimationBuilder<double>(
  tween: Tween(begin: 0, end: 1),
  duration: const Duration(milliseconds: 600),
  builder: (context, value, child) {
    return Opacity(opacity: value, child: child);
  },
  child: ProjectCard(project: project),
)
```

### Add Back-to-Top Button
```dart
// In home_page.dart
final _scrollController = ScrollController();

// Add FloatingActionButton
floatingActionButton: ScrollToTop(controller: _scrollController),

// Wrap SingleChildScrollView
SingleChildScrollView(
  controller: _scrollController,
  child: Column(...),
)
```

---

## 🚀 You're Ready!

Pick the examples that match your profile and customize away! 🎉
