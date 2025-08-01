import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio2025/localization/app_localizations.dart';
import 'package:portfolio2025/providers/providers.dart';
import 'package:portfolio2025/sections/projects_section.dart';
import 'package:portfolio2025/widgets.dart/floating_particles.dart';
import 'package:portfolio2025/widgets.dart/morphing_background.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final size = MediaQuery.of(context).size;

    final allProjects = [
      {
        'title': AppLocalizations.translate('project1_title', locale),
        'url': 'https://editto.web.app',
        'image': 'assets/images/project1.png',
        'description': AppLocalizations.translate('project1_desc', locale),
        'technologies': [
          'Flutter',
          'Python',
          'AI',
          'Firebase',
          'Cloud Run',
          'Stripe'
        ],
        'color': const Color(0xFF6C5CE7),
      },
      {
        'title': AppLocalizations.translate('project4_title', locale),
        'image': 'assets/images/project4.png',
        'url': 'https://baelmeireles.itch.io/rubberduck',
        'description': AppLocalizations.translate('project4_desc', locale),
        'technologies': ['Flutter', 'AI'],
        'color': const Color(0xFF00B894),
      },

      {
        'title': AppLocalizations.translate('project3_title', locale),
        'image': 'assets/images/project3.jpg',
        'url': '',
        'description': AppLocalizations.translate('project3_desc', locale),
        'technologies': [
          'Flutter',
          'Python',
          'AI',
          'Selenium',
        ],
        'color': const Color(0xFFE17055),
      },
      {
        'title': AppLocalizations.translate('project2_title', locale),
        'image': 'assets/images/project2.png',
        'url': 'https://stockchef.web.app',
        'description': AppLocalizations.translate('project2_desc', locale),
        'technologies': ['Flutter', 'Firebase', 'Stripe'],
        'color': const Color(0xFF6C5CE7),
      },
      // Add more projects here as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.translate('projects', locale),
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Stack(
        children: [
          // Background with Morphing Shapes
          const MorphingBackground(),

          // Floating Particles
          const FloatingParticles(),

          // Main content
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
                vertical: 60,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  ...allProjects.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> project = entry.value;

                    return FadeInUp(
                      duration: const Duration(milliseconds: 800),
                      delay: Duration(milliseconds: 200 * index),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: ProjectCard(
                          title: project['title'],
                          image: project['image'],
                          description: project['description'],
                          technologies:
                              List<String>.from(project['technologies']),
                          color: project['color'],
                          isReversed: index % 2 == 1,
                          url: project['url'],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
