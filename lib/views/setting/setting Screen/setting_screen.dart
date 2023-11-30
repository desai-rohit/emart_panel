import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/profile_controller.dart';
import 'package:ecommerse_seller_dev_app/services/store_services.dart';
import 'package:ecommerse_seller_dev_app/views/auth/login_screen.dart';
import 'package:ecommerse_seller_dev_app/views/setting/chnage_email_pass.dart/chnage_email_pass.dart';
import 'package:ecommerse_seller_dev_app/views/setting/edit_profile.dart';
import 'package:ecommerse_seller_dev_app/views/setting/message_screen/message_screen.dart';
import 'package:ecommerse_seller_dev_app/views/setting/shop_setting.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return FutureBuilder(
      future: StoreServices.getProfile(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          controller.snapshotData = snapshot.data!.docs[0];
          return Scaffold(
            appBar: AppBar(
              backgroundColor: redColor,
              centerTitle: true,
              title: const Text(
                "PROFILE",
              ),
              titleTextStyle: const TextStyle(
                  color: white, fontSize: 18, fontWeight: FontWeight.bold),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(() => EditProfile(
                            data: controller.snapshotData,
                          ));
                    },
                    icon: const Icon(Icons.edit)),
                TextButton(
                    onPressed: () {
                      // Get.find<AuthController>().signoutMethod(context);
                      // Get.off(() => LoginScreen());
                      FirebaseAuth.instance.signOut().then(
                          (value) => Get.offAll(() => const LoginScreen()));
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: white),
                    ))
              ],
            ),
            body: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                         CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          backgroundImage: NetworkImage(
                            controller.snapshotData!["image"],
                          ),
                        ),
                        sizedBoxWidget(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.snapshotData!["name"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text("${currentUser!.email}"),
                          ],
                        )
                      ],
                    ),
                    const Divider(
                      color: fontGrey,
                    ),
                    sizedBoxWidget(height: 16),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade500),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const ShopSetting());
                            },
                            child: const ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Setting"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const MessageScreen());
                            },
                            child: const ListTile(
                              leading: Icon(Icons.message),
                              title: Text("Message"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ChangeEmailPass(
                                    data: controller.snapshotData,
                                  ));
                            },
                            child: const ListTile(
                              leading: Icon(Icons.login),
                              title: Text("Chnage Email And Password"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          );
        }
      },
    );
  }
}
