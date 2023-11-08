import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/order_confirm.dart';
import 'package:ecommerse_seller_dev_app/views/widget/cnfirm_order_widget.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OrderConfirm extends StatelessWidget {
  dynamic data;
  OrderConfirm({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrderConfirmcontroller());
    return WillPopScope(
      onWillPop: () async {
        controller.snapshotData = data;
        return true;
      },
      child: Scaffold(
          backgroundColor: lightGrey,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "ORDER CONFIRM",
              style: TextStyle(color: white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16), color: white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.red,
                              child: Image.network(
                                data["order"]["img"],
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                data["order"]["title"].toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("QTY ${data["order"]["qty"]}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(data["venderId"])
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "RS ${data["order"]["tprice"]}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), color: white),
                  child: Column(
                    children: [
                      Obx(
                        () => controller.confirmisloading.isTrue
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            data["order_confirmed"] == true
                                                ? Colors.green
                                                : controller
                                                        .orderconfirmed.isTrue
                                                    ? Colors.green
                                                    : purpleColor),
                                    onPressed: () {
                                      controller.orderconfirmed.isTrue
                                          ? controller.orderConfirmfalse(
                                              docid: data.id,
                                              orderConfirm: false)
                                          : controller.orderConfirmtrue(
                                              docid: data.id,
                                              orderConfirm: true);
                                    },
                                    child: Text(
                                      controller.orderconfirmed.isTrue
                                          ? "ORDER CONFIRMED"
                                          : "ORDER CONFIRM",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => controller.shipisloading.isTrue
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            data["order_on_delivery"] == true
                                                ? Colors.green
                                                : controller.orderShip.isTrue
                                                    ? Colors.green
                                                    : purpleColor),
                                    onPressed: () {
                                      controller.orderShip.isTrue
                                          ? controller.orderShipfalse(
                                              docid: data.id,
                                              orderConfirm: false)
                                          : controller.orderShiptrue(
                                              docid: data.id,
                                              orderConfirm: true);
                                    },
                                    child: Text(
                                      controller.orderShip.isTrue
                                          ? "ORDER SHIPED"
                                          : "ORDER SHIP",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: white,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "User Review",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      VxRating(
                        maxRating: 5,
                        isSelectable: false,
                        value:
                            double.parse(data["review"]["rating"].toString()),
                        onRatingUpdate: (value) {},
                      ),
                      Text(
                        data["review"]["review_des"],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      orderWidget(
                          title1: "Order Code",
                          subtitle1: data['order_code'].toString(),
                          title2: "Shopping Method",
                          subtitle2: "Home Delivery",
                          subtitlefontsize1: 18,
                          subtitlecolor1: red),
                      const SizedBox(
                        height: 16,
                      ),
                      orderWidget(
                        title1: "Order Date & Time",
                        subtitle1: data["Order_date"],
                        title2: "Payment Method",
                        subtitle2: data["order_payment"],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      orderWidget(
                          title1: "Payment Status",
                          subtitle1: data["order_payment"] == "Cash On Delivery"
                              ? "post Paid"
                              : "Pripaid",
                          title2: "Delivery Status",
                          subtitle2: data["order_deliverd"] == true ||
                                  data["order_confirmed"] == true
                              ? "Order Deliverd"
                              : "Order Ship"),
                      const SizedBox(
                        height: 16,
                      ),
                      orderWidget(
                        title1: "Shopping Address",
                        subtitle1:
                            "${data["order_by_name"]}\n${data["order_by_address"]}\n${data["order_by_city"]}\n${data["order_by_state"]}${data["order_by_postalcode"]}\n${data["order_by_phone"]}",
                        title2: "Total Amount",
                        subtitle2: data["order"]["tprice"].toString(),
                        subtitlefontsize2: 18,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), color: white),
                  child: Column(
                    children: [
                      orderListtile(
                          title: "Product Total",
                          trailing: data["order"]["tprice"].toString()),
                      orderListtile(title: "Delivery fee", trailing: "Free"),
                      const Divider(
                        color: fontGrey,
                      ),
                      orderListtile(
                          title: "Sub Total",
                          trailing: data["order"]["tprice"].toString()),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
