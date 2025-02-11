import 'dart:math' show pi;

import 'package:flutter/material.dart';

class EmptyCirclePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double radius;

  EmptyCirclePainter(
      {required this.radius, required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    final center = Offset(size.width / 2, size.height / 2);

    // Adjust for stroke width

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0,
        3 * pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
