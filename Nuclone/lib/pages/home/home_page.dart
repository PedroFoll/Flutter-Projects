import 'package:flutter/material.dart';
import 'package:nuclone/pages/home/widgets/menu_app.dart';
import 'package:nuclone/pages/home/widgets/my_app_bar.dart';
import 'package:nuclone/pages/home/widgets/my_dots_app.dart';
import 'package:nuclone/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu = false;
  int _currentIndex = 0;
  double _yPosition = 0;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeigt = MediaQuery.of(context).size.height;
    if (_yPosition == 0) {
      _yPosition = _screenHeigt * .25;
    }
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
              showMenu: _showMenu,
              onTap: () {
                setState(() {
                  _showMenu = !_showMenu;
                  _yPosition =
                      _showMenu ? _screenHeigt * .80 : _screenHeigt * .24;
                });
              }),
          MenuApp(
            top: _screenHeigt * .23,
            showMenu: _showMenu,
          ),
          PageViewApp(
            showMenu: _showMenu,
            top:
                _yPosition, //!_showMenu ? _screenHeigt * .25 : _screenHeigt * .25,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionBottomLimit = _screenHeigt * .80;
              double positionTopLimit = _screenHeigt * .25;
              double midlePosition = positionBottomLimit - positionTopLimit;
              midlePosition = midlePosition / 3;
              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition = _yPosition > positionTopLimit + midlePosition
                      ? positionBottomLimit
                      : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition = _yPosition < positionBottomLimit - midlePosition
                      ? positionTopLimit
                      : _yPosition;
                }

                if (_yPosition == positionBottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDots(
            showMenu: _showMenu,
            top: _screenHeigt * .75,
            currentIndex: _currentIndex,
          )
        ],
      ),
    );
  }
}
