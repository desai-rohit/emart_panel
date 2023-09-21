import 'package:ecommerse_seller_dev_app/const/const.dart';

Widget normalText(
    {required String text,
    double? fontsize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign}) {
  return Text(
    textAlign: textAlign,
    text,
    style: TextStyle(fontSize: fontsize, color: color, fontWeight: fontWeight),
  );
}
