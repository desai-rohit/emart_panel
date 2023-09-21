import 'package:ecommerse_seller_dev_app/const/const.dart';

Widget dashBoardWidget(
    {required String text1,
    required String text2,
    required,
    required String icon,
    context}) {
  return Container(
    padding: const EdgeInsets.all(16),
    width: MediaQuery.of(context).size.width * 0.45,
    height: MediaQuery.of(context).size.width * 0.3,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), color: purpleColor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: const TextStyle(
                  color: white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              text2,
              style: const TextStyle(
                  color: white, fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        ImageIcon(
          AssetImage(icon),
          color: white,
          size: MediaQuery.of(context).size.width * 0.09,
        )
      ],
    ),
  );
}
