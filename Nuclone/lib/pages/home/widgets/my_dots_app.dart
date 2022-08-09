import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDots extends StatelessWidget {
  final double top;
  final int currentIndex;
  final bool showMenu;

  const MyDots(
      {super.key,
      required this.top,
      required this.currentIndex,
      required this.showMenu});

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: showMenu ? 0 : 1,
          child: Row(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(microseconds: 300),
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: getColor(0),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              AnimatedContainer(
                duration: Duration(microseconds: 300),
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: getColor(1),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              AnimatedContainer(
                duration: Duration(microseconds: 300),
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: getColor(2),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ));
  }
}
