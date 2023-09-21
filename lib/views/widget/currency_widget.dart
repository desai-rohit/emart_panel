import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:intl/intl.dart';

Widget currencyWidget({data, double? fontsize, Color? color}) {
  return Text(
    NumberFormat.currency(
      symbol: "₹ ",
      locale: "HI",
      decimalDigits: 0,
    ).format(int.parse(data)),
    // data[index]["p_price"],
    style: TextStyle(fontSize: fontsize, color: color),
  );
}
