import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/auth_controller.dart';
import 'package:ecommerse_seller_dev_app/views/auth/email_verification.dart';
import 'package:ecommerse_seller_dev_app/views/auth/forget_password.dart';
import 'package:ecommerse_seller_dev_app/views/auth/login_screen.dart';
import 'package:ecommerse_seller_dev_app/views/home/home.dart';
import 'package:ecommerse_seller_dev_app/views/widget/normal_text.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';

import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: width / 6),
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: Obx(
            () => Column(
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
                  icLogo,
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
                TextFormField(
                  controller: controller.namecontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: white,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      hintText: "Enter Name",
                      hintStyle: TextStyle(color: white)),
                ),
                sizedBoxWidget(height: 8),
                TextFormField(
                  controller: controller.emailcontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: white,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      hintText: "Enter Email Address",
                      hintStyle: TextStyle(color: white)),
                ),
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
                sizedBoxWidget(height: 8),
                TextFormField(
                  obscureText: true,
                  controller: controller.reenterpasswordcontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: white,
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Reenter Password",
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
                    : ElevatedButton(
                                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 16)),

                        onPressed: () async {
                          // if (controller.emailcontroller.value.text != "" &&
                          //     controller.passwordcontroller.text != "") {
                          //   controller.isLoading(true);
                          //   await controller
                          //       .loginMethod(context)
                          //       .then((value) => controller.storeUserData(
                          //           name: controller.namecontroller.text,
                          //           address: controller.addresscontroller.text,
                          //           email:
                          //               controller.emailcontroller.value.text,
                          //           password:
                          //               controller.passwordcontroller.text))
                          //       .then((value) {
                          //     Get.offAll(() => const Home());
                          //     controller.isLoading(false);
                          //   });
                          // } else if (controller.emailcontroller.value.text ==
                          //     "") {
                          //   VxToast.show(context,
                          //       msg: "Please Enter Email Address");
                          // } else if (controller.passwordcontroller.text == "") {
                          //   VxToast.show(context, msg: "Please Enter Password");
                          // } else {
                          //   VxToast.show(context,
                          //       msg: "Enter Wrong Email Address Or Password");
                          // }

                          try {
                            if (controller.passwwordvalidateStructure(
                                    controller.passwordcontroller.text) !=
                                true) {
                              VxToast.show(context, msg: "Week Password");
                            } else if (controller.passwordcontroller.text !=
                                controller.reenterpasswordcontroller.text) {
                              VxToast.show(context, msg: "Password Not Match");
                            } else if (controller.namecontroller.text.isEmpty &&
                                controller.emailcontroller.text.isEmpty &&
                                controller.passwordcontroller.text.isEmpty &&
                                controller
                                    .reenterpasswordcontroller.text.isEmpty) {
                              VxToast.show(context,
                                  msg: "please All Filed Fill");
                            } else {
                              await controller
                                  .signupMethod(
                                      controller.emailcontroller.text,
                                      controller.passwordcontroller.text,
                                      context)
                                  .then((value) => controller.storeUserData(
                                        name: controller.namecontroller.text,
                                        password:
                                            controller.passwordcontroller.text,
                                        email: controller.emailcontroller.text,
                                      ))
                                  .then((value) async {
                                User? user = FirebaseAuth.instance.currentUser;

                                if (user != null && !user.emailVerified) {
                                  await user.sendEmailVerification().then(
                                      (value) => Get.offAll(
                                          () => const EmailVerification()));
                                } else {
                                  VxToast.show(context,
                                      msg: 'Logeed In Successful');
                                  Get.offAll(() => const Home());
                                }
                              });
                            }
                          } catch (e) {
                            auth.signOut();
                            // ignore: use_build_context_synchronously
                            VxToast.show(context, msg: e.toString());
                          }
                        },
                        child:  const Text("Sign Up")),
                         sizedBoxWidget(height: 8),
                        RichText(text:   TextSpan(
                          text: "Already Sign Up? ",
                          children: [

                            TextSpan(recognizer: TapGestureRecognizer()..onTap=()=>Get.to(const LoginScreen()), text: "Login",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blue))

                          ]
                        )),
                sizedBoxWidget(height: 8),
                normalText(
                    text:
                        "in case any probleam please conatct eMartSeller@email.com",
                    color: lightGrey)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
