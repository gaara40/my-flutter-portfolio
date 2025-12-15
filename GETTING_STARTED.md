# 🚀 Getting Started with Your Portfolio

## Quick Setup (5 minutes)

### 1. Verify Flutter Web is Enabled
```bash
flutter web
```

### 2. Get Dependencies
```bash
flutter pub get
```

### 3. Run the App
```bash
flutter run -d web-server
```

Your portfolio is now running at `http://localhost:5000`

---

## 📝 Customization Checklist

Follow these steps to make the portfolio yours:

### Step 1: Update Hero Section
**File**: `lib/sections/hero_section.dart`

Find and replace:
```dart
'John Developer'              → Your name
'Flutter & Android Developer' → Your title
'I specialize in building...' → Your intro
```

### Step 2: Update About Section
**File**: `lib/sections/about_section.dart`

Edit the text in `_buildContent()`:
```dart
Text('I\'m a passionate Flutter developer...') → Your background
```

Update tech categories in `_buildTechStack()`:
```dart
'Frontend': ['Flutter', 'Dart', ...] → Your skills
'Backend': ['Node.js', 'Firebase', ...] → Your skills
'Tools': ['Git', 'VS Code', ...] → Your skills
```

### Step 3: Update Skills
**File**: `lib/sections/skills_section.dart`

Replace the `skillsByCategory` map:
```dart
static const Map<String, List<String>> skillsByCategory = {
  'Your Category': ['Skill 1', 'Skill 2', ...],
  'Another Category': ['Skill 3', 'Skill 4', ...],
};
```

### Step 4: Update Projects
**File**: `lib/models/project_model.dart`

Replace projects in `ProjectData.projects`:
```dart
ProjectModel(
  title: 'Your Project Title',
  description: 'What does this project do?',
  technologies: ['Flutter', 'Firebase', ...],
  githubUrl: 'https://github.com/yourname/project',
  demoUrl: 'https://demo-link.com',
),
```

### Step 5: Update Contact Info
**File**: `lib/sections/contact_section.dart`

In both `_buildDesktopLayout()` and `_buildMobileLayout()`:
```dart
_buildContactMethod(
  context,
  Icons.email_outlined,
  'Email',
  'your.email@example.com',        // Change this
  'mailto:your.email@example.com', // And this
),
```

### Step 6: Update Resume Section
**File**: `lib/sections/resume_section.dart`

Update the experience and education:
```dart
_buildQuickFact(context, 'Experience', '5+ years in Flutter') → Your experience
_buildQuickFact(context, 'Education', "Bachelor's in CS") → Your education
```

---

## 🔗 Enable Links (Optional)

To make GitHub/Demo/Contact links work, add url_launcher:

```bash
flutter pub add url_launcher
```

Then update `lib/widgets/project_card.dart`:

```dart
import 'package:url_launcher/url_launcher.dart';

// In the ElevatedButton:
onPressed: () async {
  if (await canLaunchUrl(Uri.parse(project.githubUrl!))) {
    await launchUrl(Uri.parse(project.githubUrl!));
  }
},
```

And update `lib/sections/contact_section.dart`:

```dart
import 'package:url_launcher/url_launcher.dart';

// In the GestureDetector:
onTap: () async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  }
},
```

---

## 🎨 Customize Colors/Theme

**File**: `lib/theme/app_theme.dart`

At the top, modify these constants:

```dart
static const Color _bgPrimary = Color(0xFF0F1419);      // Main background
static const Color _bgSecondary = Color(0xFF1A1F28);   // Cards background
static const Color _accentColor = Color(0xFF00D4FF);   // Primary color
static const Color _textPrimary = Color(0xFFFFFFFF);   // Main text
static const Color _textSecondary = Color(0xFFB0B0B0); // Secondary text
```

---

## 📱 Testing Responsiveness

### Desktop View
```bash
flutter run -d web-server
# Open http://localhost:5000 in browser
```

### Mobile View
In your browser DevTools:
1. Press `F12`
2. Click device toolbar icon
3. Select iPhone or Android device

---

## 🚀 Build for Production

```bash
flutter build web --release
```

Output will be in `build/web/`

### Deploy to Firebase Hosting

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Initialize Firebase
firebase login
firebase init hosting

# Deploy
firebase deploy
```

---

## ✨ File Structure Reference

```
lib/
├── main.dart                          # App entry point
├── home_page.dart                     # All sections stacked
├── theme/
│   └── app_theme.dart                 # Colors, fonts, spacing
├── sections/
│   ├── hero_section.dart              # 👈 Update: name, title, intro
│   ├── about_section.dart             # 👈 Update: background, experience
│   ├── skills_section.dart            # 👈 Update: skill categories
│   ├── projects_section.dart          # (Uses ProjectData)
│   ├── resume_section.dart            # 👈 Update: experience, education
│   └── contact_section.dart           # 👈 Update: email, LinkedIn, GitHub
├── widgets/
│   ├── section_heading.dart           # Reusable component
│   ├── project_card.dart              # Reusable component
│   └── skill_chip.dart                # Reusable component
└── models/
    └── project_model.dart             # 👈 Update: projects
```

---

## 🐛 Troubleshooting

### App doesn't start
```bash
flutter clean
flutter pub get
flutter run -d web-server
```

### Changes not reflecting
- **Hot reload** usually works (`r` in terminal)
- For major changes, **hot restart** (`R` in terminal)
- Last resort: Close and restart the server

### Import errors
Make sure all imports are correct:
```dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/section_heading.dart';
// etc.
```

---

## 📚 Learn More

- [Flutter Web](https://flutter.dev/web)
- [Material 3 Guide](https://m3.material.io/)
- [Dart Documentation](https://dart.dev/guides)

---

## ✅ Deployment Checklist

Before sending to recruiters:

- [ ] Update all personal information
- [ ] Add real projects (minimum 3)
- [ ] Update skills section
- [ ] Add resume download link
- [ ] Enable url_launcher for links
- [ ] Test on mobile and desktop
- [ ] Build production release
- [ ] Deploy to hosting service
- [ ] Test live deployment
- [ ] Share with recruiters! 🎉

---

**You're all set!** Your portfolio is production-ready. Customize it, deploy it, and share it! 🚀
