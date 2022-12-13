// ignore_for_file: use_key_in_widget_constructors

import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'app/views/home_view.dart';

main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: HomeController.instance,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            theme: ThemeData.dark(),
            home: HomeView(),
          );
        });
  }
}
