import 'package:flutter/material.dart';

class ArrowPage extends StatelessWidget {
  const ArrowPage({
    Key? key,
    this.offsets,
  }) : super(key: key);

  final Map<String, Map<String, Offset?>>? offsets;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArrowPainter(
        offsets: offsets,
      ),
      size: MediaQuery.of(context).size,
    );
  }
}

class ArrowPainter extends CustomPainter {
  ArrowPainter({
    this.offsets,
  });

  final Map<String, Map<String, Offset?>>? offsets;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path();

    if (offsets != null) {
      if (offsets!['option1'] != null) {
        path.moveTo(offsets!['option1']!['start']!.dx,
            offsets!['option1']!['start']!.dy);

        path.lineTo(
          offsets!['option1']!['start']!.dx,
          offsets!['option1']!['start']!.dy,
          // offsets!['option1']!['end']!.dx,
          // offsets!['option1']!['end']!.dy,
          // 1.0,
        );
        path.lineTo(
          offsets!['option1']!['end']!.dx,
          offsets!['option1']!['end']!.dy,
          // offsets!['option1']!['end']!.dx,
          // offsets!['option1']!['end']!.dy,
          // 1.0,
        );
      }

      if (offsets!['option2'] != null) {
        path.quadraticBezierTo(
          offsets!['option1']!['start']!.dx,
          offsets!['option1']!['start']!.dy,
          offsets!['option2']!['end']!.dx,
          offsets!['option2']!['end']!.dy,
        );
      }
      // if (offsets!['option2'] != null) {
      //   path.quadraticBezierTo(
      //     offsets!['option1']!['end']!.dx,
      //     offsets!['option1']!['end']!.dy,
      //     offsets!['option2']!['end']!.dx,
      //     offsets!['option2']!['end']!.dy,
      //   );
      // }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
