import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider para controle de tema
final themeProvider = StateProvider<bool>((ref) => false);

// Provider para controle de localização
final localeProvider = StateProvider<String>((ref) => 'pt_BR');

// Provider para mensagens de confirmação
final sendConfirmationProvider = StateProvider<String>((ref) => '');

// Provider para animações
final animationProvider = StateProvider<bool>((ref) => true);
