import 'dart:math';

import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
            ),
            child: RadialPercentWidget(
              percent: 72,
              fillColor: Colors.blue,
              lineColor: Colors.red,
              freeColor: Colors.yellow,
              lineWidth: 5,
              child: Text(
                '58%',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  late final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double percent = 0.58;

    final backgroundPaint = Paint();
    backgroundPaint.color = fillColor;
    backgroundPaint.style = PaintingStyle.fill;
    //paint.strokeWidth  = 5;
    canvas.drawOval(Offset.zero & size, backgroundPaint);
    //canvas.drawRect(Offset.zero & Size(30,30),paint);

    final fillPainter = Paint();
    fillPainter.color = freeColor;
    fillPainter.style = PaintingStyle.stroke;
    fillPainter.strokeWidth = lineWidth;
    fillPainter.strokeCap;
    canvas.drawArc(
      Offset(5.5, 5.5) & Size(size.width - 11, size.height - 11),
      -pi / 2,
      pi * 2 * percent,
      false,
      fillPainter,
    );

    final filledSpace = Paint();
    filledSpace.color = lineColor;
    filledSpace.style = PaintingStyle.stroke;
    filledSpace.strokeWidth = lineWidth;
    canvas.drawArc(
      Offset(5.5, 5.5) & Size(size.width - 11, size.height - 11),
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      filledSpace,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  RadialPercentWidget(
      {Key? key,
      required this.child,
      required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            fillColor: fillColor,
            lineColor: lineColor,
            freeColor: freeColor,
            lineWidth: lineWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Center(child: child),
        ),
      ],
    );
  }
}
