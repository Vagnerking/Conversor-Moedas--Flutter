// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, must_be_immutable
import 'package:flutter/material.dart';

import '../components/currency_box.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              CurrencyBox(
                textFieldEnable: true,
                fromCurrency: true,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              CurrencyBox(
                textFieldEnable: false,
                fromCurrency: false,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        HomeController.instance.convert();
                      },
                      child: const Text('Converter')))
            ]),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: 150,
      height: 150,
    );
  }
}
