import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toCurrency() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
        .format(this);
  }

  String toBrformatted() {
    return NumberFormat.decimalPattern('pt_BR').format(this);
  }
}