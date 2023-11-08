import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/services/store_services.dart';
import 'package:ecommerse_seller_dev_app/views/Order/Order_confirm.dart';
import 'package:ecommerse_seller_dev_app/views/widget/sizedbox_widget.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: StoreServices.getOrderProduct(currentUser!.uid),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No Orders Yet"),
          );
        } else {
          var data = snapshot.data!.docs;

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 3.0, color: purpleColor),
                        insets: EdgeInsets.symmetric(horizontal: 16.0)),
                    tabs: [
                      Text(
                        "New Order",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Complet Order",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ]),
                centerTitle: true,
                title: const Text(
                  "ORDER",
                ),
                titleTextStyle: const TextStyle(
                    color: white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              body: TabBarView(children: [
                SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: List.generate(
                          data.length,
                          (index) => Column(
                                children: [
                                  data[index]["order_deliverd"] == false
                                      ? GestureDetector(
                                          onTap: () {
                                            Get.to(() => OrderConfirm(
                                                data: data[index]));
                                          },
                                          child: ListTile(
                                            title: Text(
                                                maxLines: 2,
                                                data[index]["order"]["title"]
                                                    .toString()),
                                            leading: Image.network(
                                              data[index]["order"]["img"],
                                              cacheHeight: 100,
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                sizedBoxWidget(height: 8),
                                                Row(
                                                  children: [
                                                    const Text("12/12/23"),
                                                    sizedBoxWidget(width: 16),
                                                    const Text(
                                                      "PrePaid",
                                                      style:
                                                          TextStyle(color: red),
                                                    )
                                                  ],
                                                ),
                                                sizedBoxWidget(height: 8),
                                                const Text("45879521478952")
                                              ],
                                            ),
                                            trailing: Text(data[index]["order"]
                                                    ["tprice"]
                                                .toString()),
                                          ),
                                        )
                                      : Container(),
                                  const Divider(
                                    color: fontGrey,
                                  )
                                ],
                              )),
                    ),
                  ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: List.generate(
                          data.length,
                          (index) => Column(
                                children: [
                                  data[index]["order_deliverd"] == true
                                      ? GestureDetector(
                                          onTap: () {
                                            Get.to(() => OrderConfirm(
                                                data: data[index]));
                                          },
                                          child: ListTile(
                                            title: Text(
                                                maxLines: 2,
                                                data[index]["order"]["title"]
                                                    .toString()),
                                            leading: Image.network(
                                              data[index]["order"]["img"],
                                              cacheHeight: 100,
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                sizedBoxWidget(height: 8),
                                                Row(
                                                  children: [
                                                    const Text("12/12/23"),
                                                    sizedBoxWidget(width: 16),
                                                    const Text(
                                                      "PrePaid",
                                                      style:
                                                          TextStyle(color: red),
                                                    )
                                                  ],
                                                ),
                                                sizedBoxWidget(height: 8),
                                                const Text("45879521478952")
                                              ],
                                            ),
                                            trailing: Text(
                                              "RS ${data[index]["order"]["tprice"]}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  const Divider(
                                    color: fontGrey,
                                  )
                                ],
                              )),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
      },
    );
  }
}
