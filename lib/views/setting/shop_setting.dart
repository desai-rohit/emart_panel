import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/views/widget/button_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/edit_text_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';

class ShopSetting extends StatelessWidget {
  const ShopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              textFieldWidget(text: "Vender Name"),
              sizedBoxWidget(height: 16),
              textFieldWidget(text: "Shop Address"),
              sizedBoxWidget(height: 16),
              textFieldWidget(text: "Shop Phone Number"),
              sizedBoxWidget(height: 16),
              textFieldWidget(text: "Shop Email Address"),
              sizedBoxWidget(height: 16),
              textFieldWidget(text: "Shop Website"),
              sizedBoxWidget(height: 16),
              textFieldWidget(
                  text: "discripation",
                  maxline: 6,
                  minline: null,
                  textInputType: TextInputType.multiline),
              sizedBoxWidget(height: 16),
              buttonWidget(text: "Submit", onpress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
