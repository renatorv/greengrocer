import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  // R$ valor
  priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(price);
  }

  //
  String formatDateTime(DateTime dateTime) {
    // configurado na aula 39
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_Br').add_Hms();

    return dateFormat.format(dateTime);
  }
}
