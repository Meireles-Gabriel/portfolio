import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio2025/localization/app_localizations.dart';
import 'package:portfolio2025/providers/providers.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: 100,
      ),
      child: size.width > 768
          ? Row(
              children: [
                // Left side - Image
                Expanded(
                  flex: 2,
                  child: FadeInLeft(
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      height: size.width > 1200
                          ? 300
                          : (size.width > 768 ? 400 : 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/about.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 60),

                // Right side - Content
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInRight(
                        duration: const Duration(milliseconds: 800),
                        child: Text(
                          AppLocalizations.translate('about', locale),
                          style: GoogleFonts.montserrat(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      FadeInRight(
                        duration: const Duration(milliseconds: 1000),
                        delay: const Duration(milliseconds: 200),
                        child: Text(
                          AppLocalizations.translate('about_text', locale),
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            height: 1.8,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1200),
                        delay: const Duration(milliseconds: 400),
                        child: Row(
                          children: [
                            _buildStatCard(
                                context,
                                AppLocalizations.translate(
                                    'stat1_label', locale)),
                            const SizedBox(width: 24),
                            _buildStatCard(
                                context,
                                AppLocalizations.translate(
                                    'stat2_label', locale)),
                            const SizedBox(width: 24),
                            _buildStatCard(
                                context,
                                AppLocalizations.translate(
                                    'stat3_label', locale)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Content below the image
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  delay: const Duration(milliseconds: 200),
                  child: Text(
                    AppLocalizations.translate('about', locale),
                    style: GoogleFonts.montserrat(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),

                // Image on top for smaller screens
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  delay: const Duration(milliseconds: 200),
                  child: Container(
                    height: size.width * 0.5, // Responsive height
                    width: size.width * 0.5, // Responsive width
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/about.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32), // Spacer between image and text

                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 400),
                  child: Text(
                    AppLocalizations.translate('about_text', locale),
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      height: 1.8,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                FadeInUp(
                  duration: const Duration(milliseconds: 1200),
                  delay: const Duration(milliseconds: 600),
                  child: size.width > 768
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildStatCard(
                                context,
                                AppLocalizations.translate(
                                    'stat1_label', locale)),
                            const SizedBox(width: 24),
                            _buildStatCard(
                                context,
                                AppLocalizations.translate(
                                    'stat2_label', locale)),
                            const SizedBox(width: 24),
                            _buildStatCard(
                                context,
                                AppLocalizations.translate(
                                    'stat3_label', locale)),
                          ],
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildStatCard(
                                    context,
                                    AppLocalizations.translate(
                                        'stat1_label', locale)),
                                const SizedBox(width: 24),
                                _buildStatCard(
                                    context,
                                    AppLocalizations.translate(
                                        'stat2_label', locale)),
                              ],
                            ),
                            const SizedBox(height: 24),
                            _buildStatCard(
                                context,
                                AppLocalizations.translate(
                                    'stat3_label', locale)),
                          ],
                        ),
                ),
              ],
            ),
    );
  }

  Widget _buildStatCard(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
