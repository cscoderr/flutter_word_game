import 'package:flutter/material.dart';

class RoundedRectangle extends StatelessWidget {
  const RoundedRectangle({
    Key? key,
    this.onStart,
    this.onDrag,
    this.onEnd,
    required this.letters,
  }) : super(key: key);

  final ValueChanged<DragUpdateDetails>? onDrag;
  final ValueChanged<DragStartDetails>? onStart;
  final ValueChanged<DragEndDetails>? onEnd;
  final List<String> letters;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        onStart?.call(details);
      },
      onPanUpdate: (DragUpdateDetails details) {
        onDrag?.call(details);
        // print(details.globalPosition.dy);
      },
      onPanEnd: (details) {
        onEnd?.call(details);
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.purpleAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Text(
          letters[2],
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class RoundedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.orange;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(0, 0, 100, 100),
        const Radius.circular(20),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
