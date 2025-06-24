import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio2025/localization/app_localizations.dart';
import 'package:portfolio2025/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final size = MediaQuery.of(context).size;

    final projects = [
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
        'title': AppLocalizations.translate('project2_title', locale),
        'image': 'assets/images/project2.png',
        'url': 'https://stockchef.web.app',
        'description': AppLocalizations.translate('project2_desc', locale),
        'technologies': ['Flutter', 'Firebase', 'Stripe'],
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
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: 100,
      ),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              AppLocalizations.translate('projects', locale),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: size.width > 768 ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 60),
          ...projects.asMap().entries.map((entry) {
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
                  technologies: List<String>.from(project['technologies']),
                  color: project['color'],
                  isReversed: index % 2 == 1,
                  url: project['url'],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String image;
  final String url;
  final String description;
  final List<String> technologies;
  final Color color;
  final bool isReversed;

  const ProjectCard({
    super.key,
    required this.title,
    required this.image,
    required this.url,
    required this.description,
    required this.technologies,
    required this.color,
    this.isReversed = false,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width <= 768;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: InkWell(
          onTap:
              widget.url != '' ? () => launchUrl(Uri.parse(widget.url)) : null,
          child: Container(
            height: size.width > 1200 ? 250 : (size.width > 768 ? 300 : 500),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? widget.color.withOpacity(0.3)
                      : Colors.black.withOpacity(0.1),
                  blurRadius: _isHovered ? 20 : 10,
                  offset: Offset(0, _isHovered ? 10 : 5),
                ),
              ],
            ),
            child: isMobile
                ? Column(
                    children: [
                      _buildProjectImage(isMobile: true),
                      _buildProjectInfo(),
                    ],
                  )
                : Row(
                    children: [
                      if (!widget.isReversed) ...[
                        _buildProjectImage(),
                        _buildProjectInfo(),
                      ] else ...[
                        _buildProjectInfo(),
                        _buildProjectImage(),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage({bool isMobile = false}) {
    return Expanded(
      flex: isMobile ? 3 : 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: isMobile
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              : (widget.isReversed
                  ? const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
        ),
        child: ClipRRect(
          borderRadius: isMobile
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              : (widget.isReversed
                  ? const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
          child: Image.asset(
            widget.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectInfo() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: widget.technologies.map((tech) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: widget.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tech,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: widget.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
