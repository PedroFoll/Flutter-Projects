import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:module/common/models/digimon.dart';
import 'package:module/features/home/pages/home_error.dart';
import 'package:module/features/home/pages/home_loading.dart';
import 'package:module/features/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Digimon>>(builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return HomeLoading();
      }
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        return HomePage(list: snapshot.data!);
      }
      if (snapshot.hasError) {
        return HomeError(error: snapshot.error.toString());
      }
      return Container();
    });
  }
}
