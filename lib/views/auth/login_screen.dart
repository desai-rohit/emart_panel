import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/auth_controller.dart';
import 'package:ecommerse_seller_dev_app/services/store_services.dart';
import 'package:ecommerse_seller_dev_app/views/auth/forget_password.dart';
import 'package:ecommerse_seller_dev_app/views/auth/signup_screen.dart';
import 'package:ecommerse_seller_dev_app/views/home/home.dart';
import 'package:ecommerse_seller_dev_app/views/widget/button_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/normal_text.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';

import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: normalText(
                    text: welcome,
                    fontsize: 24,
                    fontWeight: FontWeight.bold,
                    color: white),
              ),
              sizedBoxWidget(height: 16),
              Image.asset(
                "assets/icons/logo.png",
                width: 100,
                height: 100,
              ),
              normalText(
                  text: appname,
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                  color: white),
              sizedBoxWidget(height: 24),
              Align(
                  alignment: Alignment.centerLeft,
                  child: normalText(
                      text: "log In Your Account", color: lightGrey)),
              sizedBoxWidget(height: 8),
              Obx(() {
                return TextFormField(
                  onChanged: (value) {
                    controller.email.value = value;
                  },
                  controller: controller.emailcontroller.value,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: white,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      hintText: "Enter Email Address",
                      hintStyle: TextStyle(color: white)),
                );
              }),
              sizedBoxWidget(height: 16),
              TextFormField(
                obscureText: true,
                controller: controller.passwordcontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: white,
                    ),
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: white)),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Get.to(() => const ForgetPassword());
                      },
                      child: const Text("Forget Passowrd"))),
              sizedBoxWidget(height: 24),
              controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Obx(() {
                      return StreamBuilder(
                        stream: StoreServices.getlogin(controller.email.value),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.data!.docs.isEmpty) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: darkGrey),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  VxToast.show(context,
                                      msg: "Please Sign Up First");
                                },
                                child: const Text("Log In"));
                          } else {
                            return ElevatedButton(
                                onPressed: () async {
                                  if (controller.emailcontroller.value.text !=
                                          "" &&
                                      controller.passwordcontroller.text !=
                                          "") {
                                    controller.isLoading(true);
                                    await controller
                                        .loginMethod(context)
                                        .then((value) {
                                      Get.offAll(() => const Home());
                                      controller.isLoading(false);
                                    });
                                  } else if (controller
                                          .emailcontroller.value.text ==
                                      "") {
                                    VxToast.show(context,
                                        msg: "Please Enter Email Address");
                                  } else if (controller
                                          .passwordcontroller.text ==
                                      "") {
                                    VxToast.show(context,
                                        msg: "Please Enter Password");
                                  } else {
                                    VxToast.show(context,
                                        msg:
                                            "Enter Wrong Email Address Or Password");
                                  }
                                },
                                child: const Text("Login"));
                          }
                        },
                      );
                    }),
              sizedBoxWidget(height: 8),
              buttonWidget(
                  text: "Sign Up",
                  onpress: () {
                    Get.off(() => const SignUpScreen());
                  }),
              sizedBoxWidget(height: 8),
              normalText(
                  text: "in case any probleam plase conatct @eMartSeller.com",
                  color: lightGrey)
            ],
          ),
        ),
      ),
    );
  }
}
