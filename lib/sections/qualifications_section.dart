import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio2025/localization/app_localizations.dart';
import 'package:portfolio2025/providers/providers.dart';

class QualificationsSection extends ConsumerWidget {
  const QualificationsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final size = MediaQuery.of(context).size;

    final qualifications = [
      {
        'icon': Icons.brush,
        'title': 'qualification1_title',
        'description': 'qualification1_desc',
      },
      {
        'icon': Icons.code,
        'title': 'qualification2_title',
        'description': 'qualification2_desc',
      },
      {
        'icon': Icons.api,
        'title': 'qualification3_title',
        'description': 'qualification3_desc',
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
              AppLocalizations.translate('qualifications', locale),
              style: GoogleFonts.montserrat(
                fontSize: size.width > 768 ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 60),
          AnimationLimiter(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: size.width > 768 ? 3 : 1,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio:
                    size.width > 1200 ? 1.2 : (size.width > 768 ? 0.7 : 1.2),
              ),
              itemCount: qualifications.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 800),
                  columnCount: size.width > 768 ? 3 : 1,
                  child: SlideAnimation(
                    verticalOffset: 50,
                    child: FadeInAnimation(
                      child: QualificationCard(
                        icon: qualifications[index]['icon'] as IconData,
                        title: AppLocalizations.translate(
                            qualifications[index]['title'] as String, locale),
                        description: AppLocalizations.translate(
                            qualifications[index]['description'] as String,
                            locale),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QualificationCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const QualificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<QualificationCard> createState() => _QualificationCardState();
}

class _QualificationCardState extends State<QualificationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.2)
                    : Colors.black.withValues(alpha: 0.1),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 10 : 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                widget.title,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                widget.description,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
