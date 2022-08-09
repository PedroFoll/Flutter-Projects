import 'package:flutter/material.dart';
import 'package:module/common/repositories/digimon_repository.dart';
import 'package:module/features/home/pages/home_loading.dart';
import 'package:module/features/home/pages/home_page.dart';

import 'features/home/container/home_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DigiDex 2k22',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: HomeContainer(
          repository: DigimonRepository(),
        ));
  }
}
