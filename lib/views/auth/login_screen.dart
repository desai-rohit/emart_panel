import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/auth_controller.dart';
import 'package:ecommerse_seller_dev_app/views/auth/forget_password.dart';
import 'package:ecommerse_seller_dev_app/views/auth/signup_screen.dart';
import 'package:ecommerse_seller_dev_app/views/widget/normal_text.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';
import 'package:flutter/gestures.dart';

import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: Obx(()=>
         SafeArea(
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: width / 6),
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
                // Obx(() {
                //   return
                TextFormField(
                  // onChanged: (value) {
                  //   controller.email.value = value;
                  // },
                  controller: controller.loginemailcontroller,
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
                // }),
                sizedBoxWidget(height: 16),
                TextFormField(
                  obscureText: true,
                  controller: controller.loginpasswordcontroller,
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
               controller.isLoading.isTrue?const Center(child: CircularProgressIndicator(),): ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 16)),
                    onPressed: () async {
                     controller.loginemailcontroller.text.isEmpty&&controller.loginpasswordcontroller.text.isEmpty?VxToast.show(context, msg: "Email And Password Is Empty"):  controller
                          .loginMethod(controller.loginemailcontroller.text,
                              controller.loginpasswordcontroller.text, context);
                          
                    },
                    child: const Text("Login")),
                    
                sizedBoxWidget(height: 8),
      
                RichText(text:   TextSpan(
                            text: "Create Account ",
                            children: [
      
                              TextSpan(recognizer: TapGestureRecognizer()..onTap=()=>Get.to(const SignUpScreen()), text: "Sign Up",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blue))
      
                            ]
                          )),
              
                sizedBoxWidget(height: 8),
                normalText(
                    text: "in case any probleam plase conatct @eMartSeller.com",
                    color: lightGrey)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
