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
final hoveredIndexProvider = StateProvider<dynamic>((ref) => -1);
final isGraphicProvider = StateProvider<bool>((ref) => false);
final isDataAnalystProvider = StateProvider<bool>((ref) => false);
final languageProvider = StateProvider<String>((ref) => 'pt_BR');
final sendConfirmationProvider = StateProvider<String>((ref) => '');

