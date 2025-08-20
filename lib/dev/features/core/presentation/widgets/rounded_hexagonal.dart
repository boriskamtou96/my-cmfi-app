import 'dart:math' as math;

import 'package:flutter/material.dart';

class RoundedHexagon extends StatelessWidget {
  const RoundedHexagon({
    super.key,
    this.size = 100,
    this.color = Colors.blue,
    this.cornerRadius = 8,
  });

  final double size;
  final Color color;
  final double cornerRadius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _RoundedHexagonPainter(color, cornerRadius),
    );
  }
}

class _RoundedHexagonPainter extends CustomPainter {
  final Color color;
  final double radius;

  _RoundedHexagonPainter(this.color, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    final w = size.width;
    final h = size.height;
    final r = radius;

    final angle = math.pi / 3;
    final centerX = w / 2;
    final centerY = h / 2;
    final radiusOuter = w / 2;

    final points = List<Offset>.generate(6, (i) {
      final a = angle * i - math.pi / 2;
      return Offset(
        centerX + radiusOuter * math.cos(a),
        centerY + radiusOuter * math.sin(a),
      );
    });

    for (var i = 0; i < points.length; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % points.length];

      final direction = (p2 - p1);
      final length = direction.distance;
      final unit = direction / length;

      final p1Rounded = p1 + unit * r;
      final p2Rounded = p2 - unit * r;

      if (i == 0) {
        path.moveTo(p1Rounded.dx, p1Rounded.dy);
      } else {
        path.lineTo(p1Rounded.dx, p1Rounded.dy);
      }

      path.arcToPoint(
        p2Rounded,
        radius: Radius.circular(r),
        clockwise: true,
      );
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
