import 'package:intl/intl.dart';
import 'package:brasil_fields/brasil_fields.dart';

class DoubleFormatterUtil{

  static String format(double value, int decimalPlaces) {
    String format = "#,##0";
    if (decimalPlaces > 0) {
      format += ".";
      for (int i = 0; i < decimalPlaces; i++) {
        format += "0";
      }
    }
    return NumberFormat(format).format(value);
  }

  static String doubleToString({required double value, bool isCurrency = true}) {
    return UtilBrasilFields.obterReal(value, moeda: isCurrency);
  }




  static double fromStringToDouble({required String value}) {
    if(value.isEmpty) {
      return 0.0;
    }
    return double.parse(value.replaceAll("R\$", "").replaceAll(".", "") .replaceAll(",", "."));
  }
}