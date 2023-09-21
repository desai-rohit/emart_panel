import 'dart:io';

import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/profile_controller.dart';
import 'package:ecommerse_seller_dev_app/views/widget/button_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class EditProfile extends StatelessWidget {
  dynamic data;
  EditProfile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    TextEditingController name =
        TextEditingController(text: controller.snapshotData!["name"]);
    TextEditingController address =
        TextEditingController(text: controller.snapshotData!["address"]);
    TextEditingController contact =
        TextEditingController(text: controller.snapshotData!["email"]);

    return Scaffold(
        appBar: AppBar(
          actions: const [],
          backgroundColor: redColor,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Obx(
            () => controller.isloading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: white,
                          radius: 50,
                          backgroundImage: data["image"] == "" &&
                                  controller.profileimagepath.isEmpty
                              ? const AssetImage('assets/product.jpg')
                              : data["image"] != "" &&
                                      controller.profileimagepath.isEmpty
                                  ? NetworkImage(data["image"])
                                  : FileImage(File(
                                          controller.profileimagepath.value))
                                      as ImageProvider),
                      ElevatedButton(
                          onPressed: () {
                            controller.chnageImage(context);
                          },
                          child: const Text("Chnage")),
                      sizedBoxWidget(height: 16),
                      TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      sizedBoxWidget(height: 16),
                      TextFormField(
                        controller: address,
                        decoration: const InputDecoration(
                          labelText: "Address",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      sizedBoxWidget(height: 16),
                      TextFormField(
                        controller: contact,
                        decoration: const InputDecoration(
                          labelText: "Contact",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      sizedBoxWidget(height: 16),
                      TextFormField(
                        obscureText: true,
                        controller: controller.oldpasswordcontroller,
                        decoration: const InputDecoration(
                          labelText: "Enter Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      sizedBoxWidget(height: 16),
                      // TextFormField(
                      //   controller: controller.newpasswordcontroller,
                      //   decoration: InputDecoration(
                      //     labelText: "New Password",
                      //     border: OutlineInputBorder(),
                      //   ),
                      // ),
                      sizedBoxWidget(height: 24),
                      buttonWidget(
                          text: "Submit",
                          onpress: () async {
                            controller.isloading(true);

                            // if not select new image
                            if (controller.profileimagepath.value.isNotEmpty) {
                              await controller.uploadProfileImage(context);
                            } else {
                              controller.profileimagelink = data["image"];
                            }

                            // if password match
                            if (data["password"] ==
                                controller.oldpasswordcontroller.text) {
                              // await controller.chnageAuthPassword(
                              //     data["email"],
                              //     controller.oldpasswordcontroller.text,
                              //     controller.newpasswordcontroller.text);

                              await controller.updateProfile(
                                imageurl: controller.profileimagelink,
                                name: controller.namecontroller.text == ""
                                    ? name.text
                                    : controller.namecontroller.text,
                                address: controller.addresscontroller.text == ""
                                    ? address.text
                                    : controller.addresscontroller.text,
                                contact: controller.contactcontroller.text == ""
                                    ? contact.text
                                    : controller.contactcontroller.text,
                              );

                              // ignore: use_build_context_synchronously
                              VxToast.show(context, msg: "Profile Updated");
                              controller.isloading(false);
                            } else {
                              // ignore: use_build_context_synchronously
                              VxToast.show(context, msg: "Wrong Old Password");
                              controller.isloading(false);
                            }
                          })
                    ],
                  ),
          ),
        ));
  }
}
