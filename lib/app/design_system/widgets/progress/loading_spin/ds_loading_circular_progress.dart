import 'dart:math';

import 'package:flutter/material.dart';

class DSLoadingCircularProgress extends StatefulWidget {
  const DSLoadingCircularProgress({
    super.key,
    required this.size,
    required this.strokeWidth,
    required this.primaryColor,
    required this.secondaryColor,
    this.lapDuration = 1000,
  });

  final double size;
  final int lapDuration;
  final double strokeWidth;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  State<DSLoadingCircularProgress> createState() => _CircularProgress();
}

class _CircularProgress extends State<DSLoadingCircularProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.lapDuration),
    )..repeat();
    animation = Tween<double>(begin: 0.0, end: 360.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(controller),
        child: CustomPaint(
          painter: CirclePaint(
            secondaryColor: widget.secondaryColor,
            primaryColor: widget.primaryColor,
            strokeWidth: widget.strokeWidth,
            progress: animation.value,
          ),
          size: Size(widget.size, widget.size),
        ),
      ),
    );
  }
}

class CirclePaint extends CustomPainter {
  final Color secondaryColor;
  final Color primaryColor;
  final double strokeWidth;
  final double progress;

  CirclePaint({
    required this.secondaryColor,
    required this.primaryColor,
    required this.strokeWidth,
    required this.progress,
  });

  double _degreeToRad(double degree) => degree * pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    double centerPoint = size.height / 2;

    Paint paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: [secondaryColor, primaryColor],
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));

    var scapSize = strokeWidth * 0.70;
    double scapToDegree = scapSize / centerPoint;

    double startAngle = _degreeToRad(270) + scapToDegree;
    double sweepAngle = _degreeToRad(360) - (2 * scapToDegree);

    canvas.drawArc(
      const Offset(0.0, 0.0) & Size(size.width, size.width),
      startAngle,
      sweepAngle * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
