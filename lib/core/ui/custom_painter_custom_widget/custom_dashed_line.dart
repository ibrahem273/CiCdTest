import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  double dashWidth;
  double dashSpace;
  Color dashedColor;
  double strokeWidth;

  DottedLine({
    super.key,
    required this.strokeWidth,
    required this.dashedColor,
    required this.dashWidth,
    required this.dashSpace,
  });
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedPainter(
          dashSpace: dashSpace,
          dashWidth: dashWidth,
          dashedColor: dashedColor,
          strokeWidth: strokeWidth),
      child: Container(
        height: 1.0, // Adjust the height of the line as needed
      ),
    );
  }
}

class DottedPainter extends CustomPainter {
  double dashWidth;
  double dashSpace;
  Color dashedColor;
  double strokeWidth;
  DottedPainter({
    required this.strokeWidth,
    required this.dashedColor,
    required this.dashWidth,
    required this.dashSpace,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = dashedColor // Adjust the color of the line as needed
      ..strokeWidth = strokeWidth // Adjust the thickness of the line as needed
      ..style = PaintingStyle.stroke;

    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
