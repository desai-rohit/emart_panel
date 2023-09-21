import 'dart:io';
import 'dart:math';

import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/add_product_controller.dart';
import 'package:ecommerse_seller_dev_app/views/home/home.dart';
import 'package:ecommerse_seller_dev_app/views/widget/edit_text_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';

import 'package:flutter_material_pickers/helpers/show_color_picker.dart';
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

const List<String> shirtSubCat = <String>['Man Shirt', "Women Shirt"];

const List<String> tshirtSubCat = <String>['Man T-Shirt', "Women T-Shirt"];

const List<String> autoMobile = <String>['Bike', "Car"];

const List<String> toys = <String>[
  'Bike',
  "Car",
  "doll",
];

const List<String> Mobile = <String>[
  'Bike',
  "Car",
  "doll",
];

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class colorslistclass {
  String? colorsname;
  int? colors_properti;

  colorslistclass({String? colorsname, int? colors_properti}) {
    this.colors_properti = colors_properti;
    this.colorsname = colorsname;
  }
}

class _AddProductState extends State<AddProduct> {
  var controller = Get.put(ProductAddController());

  var colorsclass = colorslistclass();

  var rndnumber = "";

  Color color = Colors.red;
  int colorlist = 1;
  var disprice = 0;
  double disper = 0;
  String dropdownValue = list.first;

  void randomNumber() {
    var rnd = Random();
    for (var i = 0; i < 12; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randomNumber();
  }

  @override
  Widget build(BuildContext context) {
    // create some values

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        actions: const [],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            padding: const EdgeInsets.all(16),
            child: Obx(
              // ignore: unrelated_type_equality_checks
              () => controller.load == true
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: redColor,
                    ))
                  : Column(
                      children: [
                        VxSwiper.builder(
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            height: 150,
                            enlargeCenterPage: true,
                            itemCount: controller.profileimagepath.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: controller.profileimagepath.isEmpty
                                        ? Image.asset("assets/product.png")
                                        : Image.file(File(controller
                                            .profileimagepath[index].path))),
                              );
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                textStyle: const TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                controller.chnageImage(context);
                              },
                              child: const Text(
                                'Select Images',
                                style: TextStyle(color: white),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                        sizedBoxWidget(height: 16),
                        textFieldWidget(
                            text: "Name", controller: controller.pname),
                        sizedBoxWidget(height: 16),
                        Row(
                          children: [
                            Flexible(
                              child: textFieldWidget(
                                  text: "O Price",
                                  controller: controller.poprice),
                            ),
                            sizedBoxWidget(width: 16),
                            Flexible(
                              child: textFieldWidget(
                                  text: "Price", controller: controller.pprice),
                            )
                          ],
                        ),
                        sizedBoxWidget(height: 16),
                        Row(
                          children: [
                            Flexible(
                              child: textFieldWidget(
                                  text: "Qty", controller: controller.pqty),
                            ),
                            sizedBoxWidget(width: 16),
                            Flexible(
                              child: textFieldWidget(
                                  text: "Seller Name",
                                  controller: controller.pseller),
                            )
                          ],
                        ),
                        sizedBoxWidget(height: 16),
                        Row(
                          children: [
                            Flexible(
                                child: DropdownButton(
                                    value: dropdownValue,
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    icon: const Icon(Icons.arrow_downward),
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    })
                                //   textFieldWidget(
                                //       text: "Category",
                                //       controller: controller.p_category),
                                ),
                            sizedBoxWidget(width: 16),
                            Flexible(
                              child: textFieldWidget(
                                  text: "SubCategory",
                                  controller: controller.psubcategory),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        textFieldWidget(
                            text: "Descripation",
                            minline: 6,
                            maxline: null,
                            textInputType: TextInputType.multiline,
                            controller: controller.pdes),
                        sizedBoxWidget(height: 16),
                        textFieldWidget(
                            text: "Color Name",
                            controller: controller.pcolorname),
                        sizedBoxWidget(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  showMaterialColorPicker(
                                    context: context,
                                    selectedColor: color,
                                    onChanged: (value) =>
                                        setState(() => colorlist = value.value),
                                  );
                                },
                                child: const Text("Color Select")),
                            sizedBoxWidget(width: 16),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Color(colorlist),
                              borderRadius: BorderRadius.circular(50)),
                          height: 54,
                          width: 54,
                        ),
                        sizedBoxWidget(height: 16),
                        GetBuilder<ProductAddController>(builder: (controller) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: purpleColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 48, vertical: 16)),
                              onPressed: () {
                                setState(() {});

                                // for (int i = 0;
                                //     i < controller.profileimagepath.length;
                                //     i++) {

                                // var image = Image.file(File(
                                //     controller.profileimagepath[i].path));

                                if (controller.profileimagepath.isEmpty &&
                                    controller.pname.text.isEmpty &&
                                    controller.poprice.text.isEmpty &&
                                    controller.pprice.text.isEmpty &&
                                    controller.pqty.text.isEmpty &&
                                    controller.pseller.text.isEmpty &&
                                    controller.psubcategory.text.isEmpty &&
                                    controller.pdes.text.isEmpty &&
                                    controller.pcolorname.text.isEmpty) {
                                  VxToast.show(context,
                                      msg:
                                          "Please All Fileds Fill And Select Image");
                                } else {
                                  // controller.uploadProfileImage(context);
                                  disprice =
                                      int.parse(controller.poprice.text) -
                                          int.parse(controller.pprice.text);

                                  disper = disprice /
                                      int.parse(controller.poprice.text) *
                                      100;

                                  controller
                                      .addnewproduct(
                                          imagelink:
                                              controller.profileimagelink,
                                          colorproprti: colorlist,
                                          discount: disper,
                                          category: dropdownValue,
                                          productId: rndnumber,
                                          context: context)
                                      .then((value) {
                                    VxToast.show(context,
                                        msg: "Add Successfully");
                                    Get.offAll(const Home());
                                  });
                                }
                              },
                              //  },
                              child: const Text(
                                "Add Product",
                                style: TextStyle(fontSize: 18),
                              ));
                        })
                      ],
                    ),
            )),
      ),
    );
  }
}
