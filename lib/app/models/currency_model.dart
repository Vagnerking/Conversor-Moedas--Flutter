class CurrencyModel {
  final String? name;
  final String? locale;
  final double? real;
  final double? dolar;
  final double? euro;
  final double? bitcoin;

  CurrencyModel(
      {this.name, this.locale, this.real, this.dolar, this.euro, this.bitcoin});

  List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
          name: 'Real',
          locale: 'pt',
          real: 1.0,
          dolar: 0.18,
          euro: 0.15,
          bitcoin: 0.000016),
      CurrencyModel(
          name: 'Dolar',
          locale: 'en',
          real: 5.63,
          dolar: 1.0,
          euro: 0.85,
          bitcoin: 0.000088),
      CurrencyModel(
          name: 'Euro',
          locale: 'eu',
          real: 6.62,
          dolar: 1.17,
          euro: 1.0,
          bitcoin: 0.00010),
      CurrencyModel(
          name: 'Bitcoin',
          locale: 'btc',
          real: 64116.51,
          dolar: 11351.30,
          euro: 9689.34,
          bitcoin: 1.0),
    ];
  }
}
