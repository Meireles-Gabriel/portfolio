import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio2025/design.dart';
import 'package:portfolio2025/portfolio_home.dart';
import 'package:portfolio2025/providers/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final String initialLocale =
      PlatformDispatcher.instance.locale.languageCode == 'pt'
          ? 'pt_BR'
          : 'en_US';

  final bool initialIsDarkTheme =
      PlatformDispatcher.instance.platformBrightness == Brightness.dark;
  runApp(
    ProviderScope(
      overrides: [
        localeProvider.overrideWith((ref) => initialLocale),
        themeProvider.overrideWith((ref) => initialIsDarkTheme),
      ],
      child: const MyPortfolio(),
    ),
  );
}

class MyPortfolio extends ConsumerWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    final currentLocale = ref.watch(localeProvider);

    return MaterialApp(
      title: 'Gabriel Meireles',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(currentLocale),
      home: const PortfolioHome(),
    );
  }
}
