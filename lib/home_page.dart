import 'package:flutter/material.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/resume_section.dart';
import 'sections/contact_section.dart';

/// Home page that orchestrates all portfolio sections.
/// Single-page scroll-based design - no routing.
/// Each section is independent and self-contained.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final projectsKey = GlobalKey();
final contactKey = GlobalKey();

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  // Scroll to specific sections using global keys
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _scrollToProjects() {
    scrollToSection(projectsKey);
  }

  void _scrollToContact() {
    scrollToSection(contactKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              onViewProjects: _scrollToProjects,
              onContactMe: _scrollToContact,
            ),
            const AboutSection(),
            const SkillsSection(),
            ProjectsSection(key: projectsKey),
            const ResumeSection(),
            ContactSection(key: contactKey),
          ],
        ),
      ),
    );
  }
}
