import 'package:flutter/material.dart';

class AppSliderShape extends SliderComponentShape {
  final double thumbRadius;

  const AppSliderShape({required this.thumbRadius});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // Background color of the thumb
    final paintBack = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xFF5CA6A6); // Custom color for the background
    final paintBorder = Paint()
      ..style = PaintingStyle.fill
      ..color = Color.fromARGB(255, 255, 255, 255);
    // Draw the background shape with a slightly rounded rectangle
    const cornerRadius = 10.0;
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.15)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawRRect(
      RRect.fromRectXY(
        Rect.fromCenter(
            center: Offset(center.dx + 3.5, center.dy), width: 20, height: 26),
        cornerRadius,
        cornerRadius,
      ),
      shadowPaint,
    );
    canvas.drawRRect(
      RRect.fromRectXY(
        Rect.fromCenter(center: center, width: 10, height: 26),
        cornerRadius,
        cornerRadius,
      ),
      paintBorder,
    );
    canvas.drawRRect(
      RRect.fromRectXY(
        Rect.fromCenter(center: center, width: 12, height: 28),
        cornerRadius,
        cornerRadius,
      ),
      paintBack,
    );

    // Draw the shadow effect
  }
}
