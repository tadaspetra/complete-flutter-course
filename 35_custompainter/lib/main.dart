import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Art Class"),
      ),
      body: CustomPaint(
        painter: MyPainter(),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()..strokeWidth = 10;
    canvas.drawLine(const Offset(50, 150), const Offset(150, 220), linePaint);
    canvas.drawLine(
        Offset(size.width - 50, 150), Offset(size.width - 150, 220), linePaint);

    Paint circlePaint = Paint();
    canvas.drawCircle(const Offset(100, 250), 20, circlePaint);
    canvas.drawCircle(Offset(size.width - 100, 250), 20, circlePaint);

    Paint arcPaint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    Rect rect = const Rect.fromLTWH(105, 350, 220, 300);
    canvas.drawArc(rect, math.pi, math.pi, true, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
