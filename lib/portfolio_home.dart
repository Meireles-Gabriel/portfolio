import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:portfolio2025/providers/providers.dart';
import 'package:portfolio2025/localization/app_localizations.dart';
import 'package:portfolio2025/widgets.dart/floating_particles.dart';
import 'package:portfolio2025/widgets.dart/morphing_background.dart';
import 'package:portfolio2025/sections/home_section.dart';
import 'package:portfolio2025/sections/qualifications_section.dart';
import 'package:portfolio2025/sections/projects_section.dart';
import 'package:portfolio2025/sections/about_section.dart';
import 'package:portfolio2025/sections/contact_section.dart';

class PortfolioHome extends ConsumerStatefulWidget {
  const PortfolioHome({super.key});

  @override
  ConsumerState<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends ConsumerState<PortfolioHome> {
  final AutoScrollController _scrollController = AutoScrollController();

  // Seções do portfolio
  final List<String> _sectionKeys = [
    'home',
    'qualifications',
    'projects',
    'about',
    'contact'
  ];

  void _scrollToSection(int index) {
    _scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeProvider);
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Elemento Gráfico 1: Background com Morphing Shapes
          const MorphingBackground(),

          // Elemento Gráfico 2: Floating Particles
          const FloatingParticles(),

          // Conteúdo principal
          Column(
            children: [
              // Header com navegação
              _buildHeader(context, currentLocale),

              // Seções do portfolio
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _sectionKeys.length,
                  itemBuilder: (context, index) {
                    return AutoScrollTag(
                      key: ValueKey(index),
                      controller: _scrollController,
                      index: index,
                      child: _buildSection(index, currentLocale),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String locale) {
    final size = MediaQuery.of(context).size;
    final isDarkTheme = ref.watch(themeProvider);

    return FadeInDown(
      duration: const Duration(milliseconds: 800),
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo/Nome
            Text(
              'GM',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            // Navegação
            if (size.width > 1200) ...[
              Row(
                children: _sectionKeys.asMap().entries.map((entry) {
                  int index = entry.key;
                  String key = entry.value;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextButton(
                      onPressed: () => _scrollToSection(index),
                      child: Text(
                        AppLocalizations.translate(key, locale),
                        style: GoogleFonts.montserrat(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],

            // Controles de tema e idioma
            Row(
              children: [
                // Switch de tema
                IconButton(
                  onPressed: () {
                    ref.read(themeProvider.notifier).state = !isDarkTheme;
                  },
                  icon: Icon(
                    isDarkTheme ? Icons.light_mode : Icons.dark_mode,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                // Switch de idioma
                TextButton(
                  onPressed: () {
                    final newLocale = locale == 'pt_BR' ? 'en_US' : 'pt_BR';
                    ref.read(localeProvider.notifier).state = newLocale;
                  },
                  child: Text(
                    locale == 'pt_BR' ? 'EN' : 'PT',
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (size.width <= 1200) ...[
                  // Burger button for small screens
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onSelected: (String newValue) {
                      final newIndex = _sectionKeys.indexOf(
                        _sectionKeys.firstWhere(
                          (key) =>
                              AppLocalizations.translate(key, locale) ==
                              newValue,
                        ),
                      );
                      _scrollToSection(newIndex);
                    },
                    itemBuilder: (BuildContext context) {
                      return _sectionKeys.map((String key) {
                        return PopupMenuItem<String>(
                          value: AppLocalizations.translate(key, locale),
                          child: Text(
                            AppLocalizations.translate(key, locale),
                            style: GoogleFonts.montserrat(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList();
                    },
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(int index, String locale) {
    switch (_sectionKeys[index]) {
      case 'home':
        return const HomeSection();
      case 'qualifications':
        return const QualificationsSection();
      case 'projects':
        return const ProjectsSection();
      case 'about':
        return const AboutSection();
      case 'contact':
        return const ContactSection();
      default:
        return Container();
    }
  }
}
