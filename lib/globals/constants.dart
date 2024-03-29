import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Constants {
  static SizedBox sizedBox({height, width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}


final menuIndexProvider = StateProvider<int>((ref) => -1);
final isAppProvider = StateProvider<bool>((ref) => false);
final hoveredIndexProvider = StateProvider<dynamic>((ref) => 0);
final isGraphicProvider = StateProvider<bool>((ref) => false);
final isDataAnalystProvider = StateProvider<bool>((ref) => false);
final languageProvider = StateProvider<String>((ref) => 'pt_BR');
final menuItemsBRProvider = StateProvider<List>((ref) => [
      'Início',
      'Sobre Mim',
      'Habilidades',
      'Portifólio',
      'Contato',
    ]);
final menuItemsENProvider = StateProvider<List>((ref) => [
      'Home',
      'About',
      'Skills',
      'Portfolio',
      'Contact',
    ]);
