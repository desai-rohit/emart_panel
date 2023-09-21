import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/views/auth/login_screen.dart';
import 'package:ecommerse_seller_dev_app/views/widget/button_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/normal_text.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "DASHBORD",
          style: TextStyle(color: white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: emailcontroller,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: white,
                  ),
                  border:
                      OutlineInputBorder(borderSide: BorderSide(color: white)),
                  hintText: "Enter Email Address",
                  hintStyle: TextStyle(color: white)),
            ),
            sizedBoxWidget(height: 16),
            buttonWidget(
                onpress: () {
                  if (emailcontroller.text.isNotEmpty) {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailcontroller.text)
                        .then((value) => Get.to(const LoginScreen()));
                    VxToast.show(context, msg: "Email Send Your Email Address");
                  } else if (emailcontroller.text == "") {
                    VxToast.show(context, msg: "Enter Email Address");
                  } else {
                    VxToast.show(context, msg: "Enter Wrong Email Address");
                  }
                },
                text: "Reset Password",
                color: Colors.black,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 16))),
            sizedBoxWidget(height: 16),
            normalText(
                text: "Check Email Address Sned Link To Reset Password",
                color: Colors.white,
                fontsize: 16,
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
