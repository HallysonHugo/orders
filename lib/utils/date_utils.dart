import 'package:intl/intl.dart';

class DateFormatters {
  static formatStringDateToDDMMYYYY(String date) {
    return DateFormat("dd/MM/yyyy")
        .format(DateFormat("yyyy-MM-dd").parse(date));
  }

  static formatStringDateToYYYYMMDD(String date) {
    return DateFormat("yyyy-MM-dd")
        .format(DateFormat("dd/MM/yyyy").parse(date));
  }

  static parseDDMMYYYYToDate(String date) {
    return DateFormat("dd/MM/yyyy").parse(date);
  }

  static formatDateTimeToString(DateTime date) {
    return DateFormat("dd/MM/yyyy HH:mm").format(date);
  }
}