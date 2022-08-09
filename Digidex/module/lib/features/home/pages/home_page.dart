import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../common/models/digimon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list}) : super(key: key);
  final List<Digimon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
