import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/home_scntroller.dart';

import 'package:ecommerse_seller_dev_app/services/store_services.dart';
import 'package:ecommerse_seller_dev_app/views/Prodcut/product_edit_page.dart';
import 'package:ecommerse_seller_dev_app/views/home/widget/DashBord_button.dart';
import 'package:ecommerse_seller_dev_app/views/widget/currency_widget.dart';
import 'package:ecommerse_seller_dev_app/views/widget/normal_text.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var ordercontroller = Get.put(firebaseOrderController());
    // var controller = Get.put(AuthController());
    List<QueryDocumentSnapshot<Object?>> productdata;
    // List totalRating = [5.0,5.0,4.1,4.5];
    var controller = Get.put(HomeController());
    // final sum = totalRating.sum;

    return StreamBuilder(
      stream: StoreServices.getOrderProduct(currentUser!.uid),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No Products"),
          );
        } else {
          var data = snapshot.data!.docs;
          for (var i = 0; i < data.length; i++) {
            // totalRating.add(data[i]["review"]["rating"]);
            // print(data[i]["review"]["rating"]);
            controller.totalRating
                .add(double.parse(data[i]["review"]["rating"]).toDouble());

            controller.ratingsum();

            if (data[i]["review"]["rating"] != "0.0") {
              controller.tottalratinguser.add(data[i]["review"]["rating"]);
            }
          }

          controller.tottalrating();

          return Scaffold(
            appBar: AppBar(
              actions: const [],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FutureBuilder(
                          future: StoreServices.getProduct(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return dashBoardWidget(
                                  context: context,
                                  text1: "Product",
                                  text2: "",
                                  icon: "assets/icons/products.png");
                            } else {
                              var totalproduct = snapshot.data!.docs;
                              return dashBoardWidget(
                                  context: context,
                                  text1: "Product",
                                  text2: totalproduct.length.toString(),
                                  icon: "assets/icons/products.png");
                            }
                          }),
                      dashBoardWidget(
                          context: context,
                          text1: "Order",
                          text2: data.length.toString(),
                          icon: "assets/icons/orders.png")
                    ],
                  ),
                  sizedBoxWidget(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashBoardWidget(
                          context: context,
                          text1: "Rateing",
                          text2: controller.rating.toStringAsFixed(1),
                          // totalRating
                          //     .reduce((value, element) => value + element),
                          icon: "assets/icons/star.png"),
                      StreamBuilder(
                        stream: StoreServices.getTotalProduct(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            var totalorder = snapshot.data!.docs;
                            return dashBoardWidget(
                                context: context,
                                text1: "Total seal",
                                text2: totalorder.length.toString(),
                                icon: "assets/icons/products.png");
                          }
                        },
                      )
                    ],
                  ),
                  const Divider(
                    color: fontGrey,
                  ),
                  sizedBoxWidget(height: 16),
                  normalText(
                      text: "Popular Prodcut",
                      fontsize: 18,
                      fontWeight: FontWeight.bold),
                  sizedBoxWidget(height: 16),
                  FutureBuilder(
                    future: StoreServices.getPopularProduct(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        productdata = snapshot.data!.docs;
                        return Expanded(
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: productdata.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => ProductEditPage(
                                        data: productdata[index],
                                        images: productdata[index]
                                            ["p_images"]));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.grey.shade300),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Image.network(
                                              productdata[index]["p_images"][0],
                                              width: 100,
                                              height: 100,
                                              cacheHeight: 100,
                                              cacheWidth: 100,
                                            )),
                                        normalText(
                                            textAlign: TextAlign.center,
                                            text: productdata[index]["pname"]),
                                        currencyWidget(
                                            data: productdata[index]["p_price"],
                                            color: Colors.red)
                                      ],
                                    ),
                                  ),
                                );
                                // ListTile(
                                //   title: normalText(text: "Prodct title"),
                                //   subtitle: normalText(text: "Rs. 599.00"),
                                //   leading: Image.asset("assets/product.jpg"),
                                // );
                              }),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
