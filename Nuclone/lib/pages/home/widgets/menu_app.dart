import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;

  const MenuApp({Key? key, required this.top, required this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: 0,
        right: 0,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: showMenu ? 1 : 0,
          child: Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(children: <Widget>[
              Image.network(
                'https://pngimg.com/uploads/qr_code/qr_code_PNG25.png',
                height: 80,
                color: Colors.white,
              )
            ]),
          ),
        ));
  }
}
