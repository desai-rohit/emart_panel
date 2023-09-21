import 'package:ecommerse_seller_dev_app/const/const.dart';

Widget textFieldWidget(
    {String? text,
    int? maxline,
    int? minline,
    TextInputType? textInputType,
    TextEditingController? controller}) {
  return TextFormField(
    maxLines: maxline,
    minLines: minline,
    controller: controller,
    decoration: InputDecoration(
      labelText: text,
      border: const OutlineInputBorder(),
    ),
  );
}
