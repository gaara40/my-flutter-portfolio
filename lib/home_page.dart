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

  void _scrollToProjects() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent * 0.40,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  void _scrollToContact() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
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
            const ProjectsSection(),
            const ResumeSection(),
            const ContactSection(),
          ],
        ),
      ),
    );
  }
}
