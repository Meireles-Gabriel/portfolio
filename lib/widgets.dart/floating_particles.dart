import 'package:floating_animation/floating_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio2025/providers/providers.dart';

class FloatingParticles extends ConsumerWidget {
  const FloatingParticles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);

    return Positioned.fill(
      child: FloatingAnimation(
        selectedShape: 'icon',
        icon: Icons.code,
        shapeColors: {
          'icon': isDarkTheme
              ? const Color(0xFFBDD5EA).withValues(alpha: 0.1)
              : const Color(0xFF657786).withValues(alpha: 0.1),
        },
        maxShapes: 15,
        speedMultiplier: 1.5,
        spawnRate: 10.0,
        direction: FloatingDirection.up,
        enableRotation: true,
        enablePulse: true,
      ),
    );
  }
}
