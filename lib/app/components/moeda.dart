// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import '../models/currency_model.dart';

class Moeda extends StatefulWidget {
  final bool isFrom;

  const Moeda({required this.isFrom});

  @override
  _MoedaState createState() =>
      // ignore: no_logic_in_create_state
      _MoedaState();
}

class _MoedaState extends State<Moeda> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<CurrencyModel>(
      isExpanded: true,
      itemHeight: 65,
      underline: Container(
        height: 1,
        color: Colors.amber,
      ),
      items: HomeController.instance.currencies
          .map((e) =>
              DropdownMenuItem(value: e, child: Text(e.name ?? 'undefined')))
          .toList(),
      onChanged: (value) {
        setState(() {
          widget.isFrom
              ? (HomeController.instance.changeFromCurrency(value!))
              : (HomeController.instance.changeToCurrency(value!));
        });
      },
      value: widget.isFrom
          ? HomeController.instance.fromCurrency
          : HomeController.instance.toCurrency,
    );
  }
}
