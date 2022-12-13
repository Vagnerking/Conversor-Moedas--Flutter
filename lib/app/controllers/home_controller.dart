import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  static HomeController instance = HomeController();

  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();

  late CurrencyModel fromCurrency;
  late CurrencyModel toCurrency;
  late List<CurrencyModel> currencies;

  HomeController() {
    currencies = CurrencyModel().getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void changeFromCurrency(CurrencyModel fromCurrency) {
    this.fromCurrency = fromCurrency;
    fromText.text = '';
    notifyListeners();
  }

  void changeToCurrency(CurrencyModel toCurrency) {
    this.toCurrency = toCurrency;
    toText.text = '';
    notifyListeners();
  }

  void convert() {
    String? text = fromText.text;
    double value = double.parse(text.replaceAll(',', '').replaceAll('\$', ''));
    double returnValue = 0;

    if (toCurrency.name == 'Real') {
      returnValue = value * (fromCurrency.real ?? 0);
    } else if (toCurrency.name == 'Dolar') {
      returnValue = value * (fromCurrency.dolar ?? 0);
    } else if (toCurrency.name == 'Euro') {
      returnValue = value * (fromCurrency.euro ?? 0);
    } else if (toCurrency.name == 'Bitcoin') {
      returnValue = value * (fromCurrency.bitcoin ?? 0);
    }

    toText.text = returnValue.toStringAsFixed(2);
  }
}
