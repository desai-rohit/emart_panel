import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/product_update_controller.dart';
import 'package:ecommerse_seller_dev_app/views/home/home.dart';
import 'package:ecommerse_seller_dev_app/views/widget/button_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/edit_text_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';
import 'package:get/get.dart';

const List<String> list = <String>[
  'Man Shirt',
  'Man T-Shirt',
  'Women Shirt',
  'women T-Shirt',
  'AutoMobile',
  'Toys',
  "Ball",
  "Mobile",
  "Cosmatic",
  "HomeDecor",
  "Applinces"
];

// ignore: must_be_immutable
class ProductEditPage extends StatelessWidget {
  dynamic data;
  List images;
  ProductEditPage({super.key, required this.data, required this.images});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductUpdatecontroller());
    TextEditingController pName = TextEditingController(text: data["p_name"]);
    TextEditingController pOprice =
        TextEditingController(text: data["p_oprice"]);
    TextEditingController pPrice = TextEditingController(text: data["p_price"]);
    TextEditingController pQty =
        TextEditingController(text: data["p_quantity"]);
    TextEditingController pCategory =
        TextEditingController(text: data["p_category"]);
    TextEditingController pSubcategory =
        TextEditingController(text: data["p_subcategory"]);
    TextEditingController pDes = TextEditingController(text: data["p_desc"]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "EDIT PRODUCT",
        ),
        titleTextStyle: const TextStyle(
            color: white, fontSize: 18, fontWeight: FontWeight.bold),
        backgroundColor: redColor,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("devproduct")
                    .doc(data["doc_id"])
                    .delete()
                    .then((value) {
                  VxToast.show(context, msg: "Delete Successfully");
                  Get.offAll(const Home());
                });
              },
              icon: const Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
        ],
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        VxSwiper.builder(
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            itemCount: data["p_images"].length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      data["p_images"][index],
                                      cacheHeight: 300,
                                      cacheWidth: 250,
                                    )),
                              );
                            }),
                        textFieldWidget(controller: pName, text: "Name"),
                        sizedBoxWidget(height: 16),
                        Row(
                          children: [
                            Flexible(
                              child: textFieldWidget(
                                  controller: pOprice, text: "o Price"),
                            ),
                            sizedBoxWidget(width: 16),
                            Flexible(
                              child: textFieldWidget(
                                  controller: pPrice, text: "Price"),
                            )
                          ],
                        ),
                        sizedBoxWidget(height: 16),
                        Row(
                          children: [
                            Flexible(
                              child: textFieldWidget(
                                  controller: pQty, text: "QTY"),
                            ),
                            sizedBoxWidget(width: 16),
                            Flexible(
                              child: textFieldWidget(text: "Seller Name"),
                            )
                          ],
                        ),
                        sizedBoxWidget(height: 16),
                        Row(
                          children: [
                            Flexible(
                              child: textFieldWidget(
                                  controller: pCategory, text: "Category"),
                            ),
                            sizedBoxWidget(width: 16),
                            Flexible(
                              child: textFieldWidget(
                                  controller: pSubcategory,
                                  text: "Sub Category"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        textFieldWidget(
                            controller: pDes,
                            text: "Descripation",
                            minline: 6,
                            maxline: null,
                            textInputType: TextInputType.multiline),
                        sizedBoxWidget(height: 16),
                        buttonWidget(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48, vertical: 16)),
                            onpress: () {
                              controller.productUpdate(
                                docid: data.id,
                                name: controller.namecontroller.text == ""
                                    ? pName.text
                                    : controller.namecontroller.text,
                                oprice: controller.opricecontroller.text == ""
                                    ? pOprice.text
                                    : controller.opricecontroller.text,
                                price: controller.pricecontroller.text == ""
                                    ? pPrice.text
                                    : controller.pricecontroller.text,
                                qty: controller.qtycontroller.text == ""
                                    ? pQty.text
                                    : controller.qtycontroller.text,
                                category:
                                    controller.categorycontroller.text == ""
                                        ? pCategory.text
                                        : controller.categorycontroller.text,
                                subcategory:
                                    controller.subcategorycontroller.text == ""
                                        ? pSubcategory.text
                                        : controller.subcategorycontroller.text,
                                desc: controller.desccontroller.text == ""
                                    ? pDes.text
                                    : controller.desccontroller.text,
                              );
                            },
                            text: "Update")
                      ],
                    )),
              ),
      ),
    );
  }
}
