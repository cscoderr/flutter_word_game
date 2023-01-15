import 'package:flutter/material.dart';
import 'package:word_game/ui/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Offset?> offsets;
  Offset? startOffset;
  Offset? startOffset2;
  Offset? startOffset3;
  Offset? startOffset4;

  @override
  void initState() {
    super.initState();

    offsets = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Game'),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: ArrowPage(
              offsets: [],
            ),
          ),
          Positioned(
            top: 0,
            right: 20,
            child: RoundedRectangle(
              onDrag: (details) {
                final renderBox = context.findRenderObject() as RenderBox;
                final localPosition =
                    renderBox.globalToLocal(details.globalPosition);
                setState(() {
                  offsets.add(localPosition);
                });
              },
              onStart: (details) {
                final renderBox = context.findRenderObject() as RenderBox;
                final localPosition =
                    renderBox.globalToLocal(details.globalPosition);
                setState(() {
                  startOffset = localPosition;
                  offsets.add(localPosition);
                });
              },
            ),
          ),
          Positioned(
            left: 20,
            top: 0,
            child: RoundedRectangle(
              onDrag: (details) {
                final renderbox = context.findRenderObject() as RenderBox;
                final localposition =
                    renderbox.globalToLocal(details.globalPosition);
                setState(() {
                  offsets.add(localposition);
                });
              },
              onStart: (details) {
                final renderbox = context.findRenderObject() as RenderBox;
                final localposition =
                    renderbox.globalToLocal(details.globalPosition);
                setState(() {
                  startOffset2 = localposition;
                  offsets.add(localposition);
                });
              },
            ),
          ),
          Positioned(
            right: 20,
            bottom: 100,
            child: RoundedRectangle(
              onDrag: (details) {
                final renderbox = context.findRenderObject() as RenderBox;
                final localposition =
                    renderbox.globalToLocal(details.globalPosition);
                setState(() {
                  offsets.add(localposition);
                });
              },
              onStart: (details) {
                final renderbox = context.findRenderObject() as RenderBox;
                final localposition =
                    renderbox.globalToLocal(details.globalPosition);
                setState(() {
                  startOffset3 = localposition;
                  offsets.add(localposition);
                });
              },
            ),
          ),
          Positioned(
            left: 20,
            bottom: 100,
            child: RoundedRectangle(
              onDrag: (details) {
                final renderbox = context.findRenderObject() as RenderBox;
                final localposition =
                    renderbox.globalToLocal(details.globalPosition);
                setState(() {
                  // offsets['4'] = Tuple2<Offset, Offset>(
                  //   startOffset4 ?? Offset.zero,
                  //   localposition,
                  // );
                  offsets.add(localposition);
                });
              },
              onStart: (details) {
                final renderbox = context.findRenderObject() as RenderBox;
                final localposition =
                    renderbox.globalToLocal(details.globalPosition);
                setState(() {
                  startOffset4 = localposition;
                  offsets.add(localposition);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ArrowPage extends StatelessWidget {
  const ArrowPage({
    Key? key,
    this.offsets,
  }) : super(key: key);

  final List<Map<String, Map<String, Offset?>>>? offsets;

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

  final List<Map<String, Map<String, Offset?>>>? offsets;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path();

    if (offsets != null && (offsets?.isNotEmpty ?? false)) {
      if (offsets!.first['option1'] != null) {
        path.moveTo(
            offsets!.first['option1']!.dx, offsets!.first['option1']!.dy);
        path.lineTo(
            offsets!.first['option1']!.dx, offsets!.first['option1']!.dy);
      }
      // for (int i = 0; i < offsets!.length; i++) {
      //   offsets![i].forEach((key, value) {
      //     path.lineTo(value!.dx, value.dy);
      //   });
      // if (i + 1 < offsets!.length && offsets?[i] != null) {
      //   if (offsets?[i] != null && offsets?[i + 1] != null) {
      //     // canvas.drawLine(offsets![i]!, offsets![i + 1]!, paint);
      //     // path.lineTo(offsets![i]!.dx, offsets![i]!.dy);
      //     // path.quadraticBezierTo(
      //     //   offsets![i].dx,
      //     //   offsets![i].dy,
      //     //   offsets![i].dx,
      //     //   offsets![i].dy,
      //     // );
      //   }
      // }
      // }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
