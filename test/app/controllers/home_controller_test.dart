import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final homeController = HomeController();

  test('deve converter de real para dolar', () {
    homeController.fromText.text = '2.0';
    homeController.convert();
    expect(homeController.toText.text, '0.36');
  });

  test('deve converter de dolar pra real', () {
    homeController.fromText.text = '0.36';
    homeController.fromCurrency = CurrencyModel(
        name: 'Dolar', real: 5.63, dolar: 1.0, euro: 0.85, bitcoin: 0.000088);
    homeController.toCurrency = CurrencyModel(
        name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    homeController.convert();
    expect(homeController.toText.text, '2.03');
  });
}
