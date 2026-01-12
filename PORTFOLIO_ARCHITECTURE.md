# Modern Flutter Web Portfolio

A production-ready, single-page Flutter Web portfolio built with clean architecture principles and Material 3 design.

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point - theme & routing setup only
├── home_page.dart           # Orchestrates all portfolio sections
│
├── theme/
│   └── app_theme.dart       # Centralized theme, colors, typography
│
├── sections/
│   ├── hero_section.dart           # Landing section with intro & CTA
│   ├── about_section.dart          # Professional background
│   ├── skills_section.dart         # Skills grouped by category
│   ├── projects_section.dart       # Featured projects grid
│   ├── resume_section.dart         # Resume download & quick facts
│   └── contact_section.dart        # Contact info & social links
│
├── widgets/
│   ├── section_heading.dart        # Reusable section title component
│   ├── project_card.dart           # Individual project display
│   └── skill_chip.dart             # Technology/skill tag
│
└── models/
    └── project_model.dart          # Project data model
```

## 🎯 Architecture Principles

### 1. **Clear Responsibility**
Each file has ONE clear purpose:
- **main.dart**: App configuration only
- **theme/**: All styling and design tokens
- **sections/**: Independent portfolio sections
- **widgets/**: Reusable UI components
- **models/**: Data structures

### 2. **No Hardcoded Styles**
All colors, spacing, and typography come from `AppTheme`:
```dart
Text(
  'Hello',
  style: Theme.of(context).textTheme.bodyLarge,
)
```

### 3. **Self-Contained Sections**
Each section is independent and can be modified without affecting others.

### 4. **Responsive Design**
- Desktop: Centered content, max width 1100px
- Mobile: Full width, stacked layout
- Uses `MediaQuery` and `LayoutBuilder` for adaptation

## 🎨 Design System

### Colors (Dark Theme)
- **Primary**: `#00D4FF` (Cyan accent)
- **Background**: `#0F1419` (Dark blue-gray)
- **Surface**: `#1A1F28` (Slightly lighter)
- **Text Primary**: `#FFFFFF`
- **Text Secondary**: `#B0B0B0`

### Typography
- **Display Large**: 48px, Bold (Hero name)
- **Display Medium**: 36px, Bold (Section titles)
- **Heading Small**: 22px, Bold (Subsections)
- **Body Large**: 16px, Regular (Main content)
- **Body Medium**: 14px, Regular (Secondary text)

### Spacing Scale
```dart
spacingXS   = 8px
spacingS   = 12px
spacingM   = 16px
spacingL   = 24px
spacingXL   = 32px
spacingXXL  = 48px
```

## 🚀 Getting Started

### Prerequisites
- Flutter Web enabled
- Flutter 3.0+

### Installation

```bash
# Get dependencies
flutter pub get

# Run the web app
flutter run -d web-server

# Build for production
flutter build web --release
```

## 📝 Customization Guide

### Update Personal Info

**Hero Section** (`lib/sections/hero_section.dart`):
```dart
Text('Your Name'),
Text('Your Title'),
Text('Your introduction...'),
```

**About Section** (`lib/sections/about_section.dart`):
```dart
_buildContent() // Edit the text here
```

**Skills** (`lib/sections/skills_section.dart`):
```dart
static const Map<String, List<String>> skillsByCategory = {
  'Your Category': ['Skill 1', 'Skill 2'],
};
```

**Projects** (`lib/models/project_model.dart`):
```dart
ProjectData.projects = [
  ProjectModel(
    title: 'Your Project',
    description: 'Description',
    technologies: ['Flutter', 'Dart'],
    githubUrl: 'https://github.com/...',
    demoUrl: 'https://...',
  ),
];
```

**Contact** (`lib/sections/contact_section.dart`):
```dart
_buildContactMethod(
  context,
  Icons.email_outlined,
  'Email',
  'your.email@example.com',
  'mailto:your.email@example.com',
),
```

### Add URL Launcher Support

To enable GitHub/Demo links:

1. Add dependency:
```bash
flutter pub add url_launcher
```

2. Update ProjectCard:
```dart
import 'package:url_launcher/url_launcher.dart';

onPressed: () async {
  if (await canLaunchUrl(Uri.parse(project.githubUrl!))) {
    await launchUrl(Uri.parse(project.githubUrl!));
  }
},
```

## 📱 Responsive Breakpoints

- **Mobile**: < 768px
- **Desktop**: ≥ 768px
- **Max Content Width**: 1100px

## 🔧 Available Widgets

### SectionHeading
Displays a consistent section title with optional subtitle.
```dart
SectionHeading(
  title: 'Featured Projects',
  subtitle: 'Work that showcases my skills',
)
```

### SkillChip
Displays a technology/skill tag with optional highlight.
```dart
SkillChip(
  label: 'Flutter',
  isHighlighted: true,
)
```

### ProjectCard
Displays a project with description, tech stack, and action buttons.
```dart
ProjectCard(project: projectModel)
```

## 📊 Page Sections

1. **Hero**: Introduction and CTA buttons
2. **About**: Professional background and experience
3. **Skills**: Grouped technology stack
4. **Projects**: Featured portfolio projects
5. **Resume**: CV download and quick facts
6. **Contact**: Email, LinkedIn, GitHub links

## ✨ Features

- ✅ Material 3 Design
- ✅ Dark Theme Only
- ✅ Fully Responsive
- ✅ Single-Page Scroll
- ✅ No State Management Required
- ✅ Clean Code Architecture
- ✅ Production Ready
- ✅ Easy to Customize

## 🎓 Best Practices Used

1. **Const constructors** throughout for optimization
2. **Descriptive widget names** for clarity
3. **Minimal nesting** for readability
4. **Clear separation of concerns**
5. **Reusable components** without duplication
6. **Centralized styling** via ThemeData
7. **Comments explaining WHY** not just WHAT

## 📄 License

MIT - Feel free to use this as a template for your portfolio!

---

**Ready to deploy?** Your portfolio is production-ready. Just customize the content and deploy to Firebase Hosting, Vercel, or your preferred host!
