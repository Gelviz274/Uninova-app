import 'dart:ui';
import 'package:flutter/material.dart';
class CenterWidgetPainter extends CustomPainter{
  final Path path;

  const CenterWidgetPainter({required this.path});

  @override
  void paint (Canvas canvas, Size size){
    final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..imageFilter = ImageFilter.blur(sigmaX: 10, sigmaY: 10)
        ..color = const Color(0xff); // Color teal en formato hexadecimal


    canvas.drawPath( path, paint);
  }
  @override
  bool shouldRepaint(CenterWidgetPainter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(CenterWidgetPainter oldDelegate) => false;
}