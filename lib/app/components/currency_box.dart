// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../formatters/currency_formatter.dart';
import 'moeda.dart';

class CurrencyBox extends StatefulWidget {
  final bool textFieldEnable;
  final bool fromCurrency;
  HomeController homeController = HomeController.instance;

  CurrencyBox({required this.textFieldEnable, required this.fromCurrency});

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<CurrencyBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                child: Moeda(isFrom: widget.fromCurrency),
              )),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Expanded(
              flex: 2,
              child: SizedBox(
                child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyInputFormatter()
                    ],
                    controller: widget.fromCurrency
                        ? widget.homeController.fromText
                        : widget.homeController.toText,
                    enabled: widget.textFieldEnable,
                    decoration: InputDecoration(
                      prefixText:
                          "${widget.fromCurrency ? (widget.homeController.fromCurrency.locale == "btc" ? NumberFormat.currency(symbol: "₿").currencySymbol : NumberFormat.currency(locale: widget.homeController.fromCurrency.locale).currencySymbol) : (widget.homeController.toCurrency.locale == "btc" ? NumberFormat.currency(symbol: "₿").currencySymbol : NumberFormat.currency(locale: widget.homeController.toCurrency.locale).currencySymbol)} ",
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber)),
                      hintText: '\$ 0.00',
                    )),
              )),
        ],
      ),
    );
  }
}
