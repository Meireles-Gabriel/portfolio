import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio2025/localization/app_localizations.dart';
import 'package:portfolio2025/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends ConsumerWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: size.width > 768
          ? Row(
              children: [
                // Lado esquerdo - Informações
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInLeft(
                        duration: const Duration(milliseconds: 1000),
                        child: Text(
                          AppLocalizations.translate('hello', locale),
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FadeInLeft(
                        duration: const Duration(milliseconds: 1200),
                        delay: const Duration(milliseconds: 200),
                        child: Text(
                          AppLocalizations.translate('name', locale),
                          style: GoogleFonts.montserrat(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FadeInLeft(
                        duration: const Duration(milliseconds: 1400),
                        delay: const Duration(milliseconds: 400),
                        child: Text(
                          AppLocalizations.translate('role', locale),
                          style: GoogleFonts.montserrat(
                            fontSize: 28,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        delay: const Duration(milliseconds: 600),
                        child: SizedBox(
                          width: 400,
                          child: Text(
                            AppLocalizations.translate('intro', locale),
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              height: 1.6,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Redes sociais
                      FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        delay: const Duration(milliseconds: 600),
                        child: Row(
                          children: [
                            _buildSocialButton(
                              context,
                              icon: 'assets/images/whatsapp.png',
                              onTap: () => launchUrl(
                                  Uri.parse('https://wa.me/5535998390325')),
                            ),
                            const SizedBox(width: 16),
                            _buildSocialButton(
                              context,
                              icon: 'assets/images/linkedin.png',
                              onTap: () => launchUrl(Uri.parse(
                                  'https://www.linkedin.com/in/developer-gabriel-meireles/')),
                            ),
                            const SizedBox(width: 16),
                            _buildSocialButton(
                              context,
                              icon: 'assets/images/github.png',
                              onTap: () => launchUrl(Uri.parse(
                                  'https://github.com/Meireles-Gabriel')),
                            ),
                            const SizedBox(width: 16),
                            _buildSocialButton(
                              context,
                              icon: 'assets/images/instagram.png',
                              onTap: () => launchUrl(Uri.parse(
                                  'https://www.instagram.com/bael.dev/')),
                            ),
                            const SizedBox(width: 16),
                            _buildSocialButton(
                              context,
                              icon: 'assets/images/youtube.png',
                              onTap: () => launchUrl(Uri.parse(
                                  'https://www.youtube.com/@BaelMeireles')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Lado direito - Foto
                Expanded(
                  flex: 2,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 1800),
                    delay: const Duration(milliseconds: 800),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3),
                            Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.3),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3),
                            blurRadius: 50,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          'assets/images/me.jpg',
                          fit: BoxFit.cover,
                          width: 400,
                          height: 400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Foto no topo para telas menores
                FadeInDown(
                  duration: const Duration(milliseconds: 1800),
                  delay: const Duration(milliseconds: 800),
                  child: Container(
                    height: size.width * 0.5, // Responsive height
                    width: size.width * 0.5, // Responsive width
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.3),
                          Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.3),
                          blurRadius: 50,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          size.width * 0.25), // Responsive border radius
                      child: Image.asset(
                        'assets/images/me.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32), // Spacer between image and text
                // Informações abaixo da foto
                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: Text(
                    AppLocalizations.translate('hello', locale),
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FadeInUp(
                  duration: const Duration(milliseconds: 1200),
                  delay: const Duration(milliseconds: 200),
                  child: Text(
                    AppLocalizations.translate('name', locale),
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                FadeInUp(
                  duration: const Duration(milliseconds: 1400),
                  delay: const Duration(milliseconds: 400),
                  child: Text(
                    AppLocalizations.translate('role', locale),
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  delay: const Duration(milliseconds: 600),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      AppLocalizations.translate('intro', locale),
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        height: 1.6,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Redes sociais para telas pequenas
                FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  delay: const Duration(milliseconds: 600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(
                        context,
                        icon: 'assets/images/whatsapp.png',
                        onTap: () =>
                            launchUrl(Uri.parse('https://wa.me/5535998390325')),
                      ),
                      const SizedBox(width: 16),
                      _buildSocialButton(
                        context,
                        icon: 'assets/images/linkedin.png',
                        onTap: () => launchUrl(Uri.parse(
                            'https://www.linkedin.com/in/developer-gabriel-meireles/')),
                      ),
                      const SizedBox(width: 16),
                      _buildSocialButton(
                        context,
                        icon: 'assets/images/github.png',
                        onTap: () => launchUrl(
                            Uri.parse('https://github.com/Meireles-Gabriel')),
                      ),
                      const SizedBox(width: 16),
                      _buildSocialButton(
                        context,
                        icon: 'assets/images/instagram.png',
                        onTap: () => launchUrl(
                            Uri.parse('https://www.instagram.com/bael.dev/')),
                      ),
                      const SizedBox(width: 16),
                      _buildSocialButton(
                        context,
                        icon: 'assets/images/youtube.png',
                        onTap: () => launchUrl(
                            Uri.parse('https://www.youtube.com/@BaelMeireles')),
                      ),
                    ],
                  ),
                ),

              ],
            ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required String icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          icon,
          color: Theme.of(context).colorScheme.primary,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
