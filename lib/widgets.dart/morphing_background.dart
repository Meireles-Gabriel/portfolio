import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio2025/providers/providers.dart';

class MorphingBackground extends ConsumerStatefulWidget {
  const MorphingBackground({super.key});

  @override
  ConsumerState<MorphingBackground> createState() => _MorphingBackgroundState();
}

class _MorphingBackgroundState extends ConsumerState<MorphingBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ref.watch(themeProvider);

    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: MorphingShapesPainter(
              progress: _animation.value,
              isDarkTheme: isDarkTheme,
            ),
            size: MediaQuery.of(context).size,
          );
        },
      ),
    );
  }
}

class MorphingShapesPainter extends CustomPainter {
  final double progress;
  final bool isDarkTheme;

  MorphingShapesPainter({required this.progress, required this.isDarkTheme});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = isDarkTheme
          ? const Color(0xFF1F2229).withValues(alpha: 0.3)
          : const Color(0xFFE8F4FD).withValues(alpha: 0.3);

    // Forma morfológica 1
    final path1 = Path();
    final centerX = size.width * 0.2;
    final centerY = size.height * 0.3;
    final radius = 100 + (50 * progress);

    path1.addOval(Rect.fromCircle(
      center: Offset(centerX, centerY),
      radius: radius,
    ));

    canvas.drawPath(path1, paint);

    // Forma morfológica 2
    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = isDarkTheme
          ? const Color(0xFF2D3142).withValues(alpha: 0.2)
          : const Color(0xFFBDD5EA).withValues(alpha: 0.2);

    final path2 = Path();
    final center2X = size.width * 0.8;
    final center2Y = size.height * 0.7;
    final radius2 = 80 + (30 * (1 - progress));

    path2.addOval(Rect.fromCircle(
      center: Offset(center2X, center2Y),
      radius: radius2,
    ));

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
