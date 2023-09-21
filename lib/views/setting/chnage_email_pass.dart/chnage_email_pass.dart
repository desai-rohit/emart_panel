import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/profile_controller.dart';
import 'package:ecommerse_seller_dev_app/views/auth/login_screen.dart';
import 'package:ecommerse_seller_dev_app/views/widget/button_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChangeEmailPass extends StatelessWidget {
  dynamic data;
  ChangeEmailPass({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    TextEditingController email =
        TextEditingController(text: controller.snapshotData!["email"]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            sizedBoxWidget(height: 16),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            sizedBoxWidget(height: 16),
            TextFormField(
              controller: controller.oldpasswordcontroller,
              decoration: const InputDecoration(
                labelText: "Enter Passowrd",
                border: OutlineInputBorder(),
              ),
            ),
            sizedBoxWidget(height: 16),
            buttonWidget(
                text: "Reset Password",
                onpress: () async {
                  User? user = FirebaseAuth.instance.currentUser;

                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: user!.email.toString())
                      .then((value) => Get.to(const LoginScreen()));
                })
          ],
        ),
      ),
    );
  }
}
