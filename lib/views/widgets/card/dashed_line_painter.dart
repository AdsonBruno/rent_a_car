import "package:flutter/material.dart";
import "package:rental_of_vehicle/views/core/app_colors.dart";

class DashedLinePainter extends CustomPainter {
  final Color? dashColor;

  DashedLinePainter({this.dashColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dashColor ?? Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final Color effectiveColor = dashColor ?? Colors.white;
    paint.color = effectiveColor;
    double dashWidth = 10;
    double dashSpace = 5;
    double x = 0;

    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dashWidth, 0), paint);
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
