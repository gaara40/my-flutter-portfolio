# 🎯 Quick Reference Card

Print this or bookmark it!

---

## 🚀 30-Second Setup

```bash
flutter pub get
flutter run -d web-server
# Visit http://localhost:5000
```

---

## ✏️ File Edit Checklist

| Change | File | Line | Time |
|--------|------|------|------|
| Your name | `hero_section.dart` | ~40 | 30s |
| Your title | `hero_section.dart` | ~45 | 30s |
| Your intro | `hero_section.dart` | ~55 | 1m |
| Your background | `about_section.dart` | ~80+ | 2m |
| Your experience | `about_section.dart` | ~95 | 1m |
| Your skills | `skills_section.dart` | ~20 | 3m |
| Your projects | `project_model.dart` | ~30 | 5m |
| Your email | `contact_section.dart` | ~160 | 30s |
| Your LinkedIn | `contact_section.dart` | ~165 | 30s |
| Your GitHub | `contact_section.dart` | ~170 | 30s |
| Your colors | `app_theme.dart` | ~8-12 | 2m |

**Total Time: ~20 minutes**

---

## 🎨 Color Palette

```
#00D4FF ← Primary Accent (Cyan)
#0F1419 ← Background (Dark)
#1A1F28 ← Surface (Lighter)
#FFFFFF ← Text (White)
#B0B0B0 ← Secondary Text
```

Change in: `lib/theme/app_theme.dart` (lines 8-12)

---

## 📏 Spacing Constants

```dart
AppTheme.spacingXS   = 8px
AppTheme.spacingSM   = 12px
AppTheme.spacingMD   = 16px   ← Most common
AppTheme.spacingLG   = 24px
AppTheme.spacingXL   = 32px
AppTheme.spacingXXL  = 48px
```

Use these instead of magic numbers!

---

## 🎭 Section Files Quick Map

```
hero_section.dart
├─ Text: Your name & title
├─ Text: Your introduction
├─ Button: "View Projects"
└─ Button: "Contact Me"

about_section.dart
├─ Text: Your background (2 paragraphs)
├─ Text: Years of experience
└─ List: Technologies by category

skills_section.dart
├─ Map: skillsByCategory
│  ├─ Mobile Development: [...]
│  ├─ Web Development: [...]
│  ├─ Backend: [...]
│  └─ Tools: [...]
└─ Display: Auto-renders as grid

projects_section.dart
├─ Uses: ProjectData.projects
├─ Component: ProjectCard
└─ Layout: 2-col desktop, 1-col mobile

resume_section.dart
├─ Button: Download Resume
└─ Facts: Experience, Education, etc.

contact_section.dart
├─ Email: your.email@example.com
├─ LinkedIn: linkedin.com/in/yourname
└─ GitHub: github.com/yourname
```

---

## 🏗️ Architecture Rules

### ✅ DO
- Edit content in `/sections`
- Edit theme in `/theme`
- Edit project data in `/models`
- Use `Theme.of(context)`
- Use `AppTheme.spacing*`
- Use const constructors
- Reuse `SkillChip`, `ProjectCard`

### ❌ DON'T
- Don't edit `main.dart`
- Don't edit `home_page.dart`
- Don't hardcode colors
- Don't create magic numbers
- Don't nest widgets > 4 levels
- Don't use late final
- Don't import unused libraries

---

## 🔄 Hot Reload Workflow

```bash
# Terminal 1 - Run the app
flutter run -d web-server

# Terminal 2 - Make edits in VS Code
# Edit a section file
# Ctrl+S to save

# Back to Terminal 1
# Press 'r' for hot reload
# Press 'R' for hot restart (for major changes)
```

---

## 📱 Responsive Testing

### Desktop (1920px)
```bash
flutter run -d web-server
# Open http://localhost:5000
# Full window
```

### Tablet (768px)
```
F12 → Device Toolbar → iPad
```

### Mobile (375px)
```
F12 → Device Toolbar → iPhone SE
```

---

## 🚀 Build & Deploy

```bash
# Build for production
flutter build web --release

# Deploy to Firebase (recommended)
firebase deploy

# Or use Vercel, GitHub Pages, Netlify
# See DEPLOYMENT.md for details
```

---

## 🐛 Troubleshooting

| Problem | Solution |
|---------|----------|
| App won't start | `flutter clean` → `flutter pub get` → `flutter run` |
| Changes not showing | Hot reload (`r`) or restart (`R`) |
| Build fails | Check `flutter doctor` |
| Dark mode looks wrong | Check `app_theme.dart` colors |
| Layout broken on mobile | Check breakpoint logic in sections |

---

## 📋 Customization Order

1. **Update Hero** (2 min)
   - Name, title, intro

2. **Update About** (3 min)
   - Background, experience

3. **Update Skills** (5 min)
   - Edit `skillsByCategory` map

4. **Update Projects** (10 min)
   - Add your projects to `ProjectData`

5. **Update Contact** (2 min)
   - Email, LinkedIn, GitHub

6. **Tweak Colors** (2 min)
   - Edit `app_theme.dart`

7. **Test** (5 min)
   - Desktop and mobile

8. **Deploy** (10 min)
   - Use `DEPLOYMENT.md`

---

## 🎓 Key Files to Know

| File | Know What |
|------|-----------|
| `main.dart` | App setup - READONLY |
| `home_page.dart` | Section list - READONLY |
| `app_theme.dart` | Colors, fonts - EDIT THIS |
| `hero_section.dart` | Intro section - EDIT THIS |
| `about_section.dart` | Background - EDIT THIS |
| `skills_section.dart` | Skills list - EDIT THIS |
| `project_model.dart` | Your projects - EDIT THIS |
| `contact_section.dart` | Contact info - EDIT THIS |

---

## 💡 Pro Tips

### Add More Projects
```dart
// In project_model.dart, add to ProjectData.projects:
ProjectModel(
  title: 'Your Project',
  description: 'What it does',
  technologies: ['Dart', 'Flutter'],
  githubUrl: 'https://github.com/...',
),
```

### Change Primary Color
```dart
// In app_theme.dart line 10:
static const Color _accentColor = Color(0xFF00D4FF); // Change this
```

### Enable Link Clicks
```bash
flutter pub add url_launcher
# Then import and use in sections
```

### Add Animations
```dart
// Use TweenAnimationBuilder or AnimatedOpacity
TweenAnimationBuilder(
  tween: Tween(begin: 0, end: 1),
  duration: Duration(ms: 600),
  builder: (context, value, child) {
    return Opacity(opacity: value, child: child);
  },
)
```

---

## 📞 Quick Links

- **Flutter Docs**: https://flutter.dev
- **Material 3**: https://m3.material.io
- **Dart Docs**: https://dart.dev
- **Firebase**: https://firebase.google.com

---

## ✅ Pre-Launch Checklist

- [ ] All sections customized
- [ ] Projects added (3+ items)
- [ ] Contact info correct
- [ ] Tested on desktop
- [ ] Tested on mobile
- [ ] Built: `flutter build web --release`
- [ ] Deployed to host
- [ ] Live URL works
- [ ] Links functional
- [ ] Ready to share! 🎉

---

## 🎉 Done!

Your portfolio is **production-ready**. 

Print this card and follow it section by section.

**Time to complete: ~45 minutes**

Good luck! 🚀
