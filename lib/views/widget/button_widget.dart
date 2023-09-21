import 'package:ecommerse_seller_dev_app/const/const.dart';

Widget buttonWidget(
    {onpress,
    String? text,
    ButtonStyle? style,
    Color? color,
    double? fontsize}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 36),
    width: double.infinity,
    child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        //   backgroundColor: white,
        // ),
        style: style,
        onPressed: onpress,
        child: Text(
          "$text",
          style: TextStyle(color: color, fontSize: fontsize),
        )),
  );
}
