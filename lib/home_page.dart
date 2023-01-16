import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_game/ui/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Map<String, Offset?>>? offsets;
  late List<Offset> offset2;
  late List<String> letters;

  @override
  void initState() {
    super.initState();
    offsets = {};
    offset2 = [];
    letters = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Word Game'),
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: Stack(
              children: [
                ArrowPage(
                  offsets: offsets,
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: MediaQuery.of(context).size.width / 2.4,
                  right: MediaQuery.of(context).size.width / 2.4,
                  child: RoundedRectangle(
                    letter: letters[Random().nextInt(26)],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 150,
                  left: 20,
                  child: RoundedRectangle(
                    letter: letters[Random().nextInt(26)],
                    onStart: (DragStartDetails details) {
                      final renderBox = context.findRenderObject() as RenderBox;
                      setState(() {
                        offsets?['option1'] = {
                          'start': details.globalPosition,
                          'end': details.globalPosition,
                        };
                      });
                    },
                    onDrag: (DragUpdateDetails details) {
                      if (offsets?['option1'] != null) {
                        //offsets!['option1']!['end']!.dx >=
                        //                             const Offset(338.0, 240.7).dx
                        if (1 == 2) {
                          setState(() {
                            print(offsets);
                            offsets?['option1'] = {
                              'start':
                                  offsets?['option1']?['start'] ?? Offset.zero,
                              'end': null,
                            };
                          });
                        } else {
                          setState(() {
                            print(offsets);
                            offsets?['option1'] = {
                              'start':
                                  offsets?['option1']?['start'] ?? Offset.zero,
                              'end': details.globalPosition,
                            };
                          });
                        }
                      } else {
                        setState(() {
                          print(offsets);
                          offsets?['option1'] = {
                            'start':
                                offsets?['option1']?['start'] ?? Offset.zero,
                            'end': details.globalPosition,
                          };
                        });
                      }
                    },
                    onEnd: (details) {
                      // setState(() {
                      //   offsets?.add(null);
                      // });
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 150,
                  right: 20,
                  child: RoundedRectangle(
                    letter: letters[Random().nextInt(26)],
                    onStart: (DragStartDetails details) {
                      print("=====reach option 2 here");
                      final renderBox = context.findRenderObject() as RenderBox;
                      setState(() {
                        offsets?['option2'] = {
                          'start': details.globalPosition,
                          'end': details.globalPosition,
                        };
                      });
                    },
                    onDrag: (DragUpdateDetails details) {
                      setState(() {
                        print(offsets);
                        offsets?['option2'] = {
                          'start': offsets?['option2']?['start'] ?? Offset.zero,
                          'end': details.globalPosition,
                        };
                        // offsets?['option1']?['end'] = details.globalPosition;
                      });
                      // print(details.globalPosition.dy);
                    },
                    onEnd: (details) {
                      // setState(() {
                      //   offsets?.add(null);
                      // });
                    },
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 90,
                  child: RoundedRectangle(
                    letter: letters[Random().nextInt(26)],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom,
                  right: 90,
                  child: RoundedRectangle(
                    letter: letters[Random().nextInt(26)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
