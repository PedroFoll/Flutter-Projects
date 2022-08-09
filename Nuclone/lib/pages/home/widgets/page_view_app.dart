import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback? onPanUpdate;
  final bool showMenu;

  const PageViewApp(
      {super.key,
      required this.top,
      required this.onChanged,
      this.onPanUpdate,
      required this.showMenu});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(microseconds: 200),
      curve: Curves.easeOut,
      top: top,
      height: MediaQuery.of(context).size.height * 0.495,
      left: 10,
      right: 10,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
            onPageChanged: onChanged,
            physics: showMenu
                ? NeverScrollableScrollPhysics()
                : BouncingScrollPhysics(),
            children: <Widget>[
              CardApp(),
              CardApp(),
              CardApp(),
            ]),
      ),
    );
  }
}
