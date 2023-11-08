import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/services/store_services.dart';
import 'package:ecommerse_seller_dev_app/views/Prodcut/add_product.dart';
import 'package:ecommerse_seller_dev_app/views/Prodcut/product_edit_page.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: StoreServices.getProduct(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data!.docs;
            return Scaffold(
              backgroundColor: lightGrey,
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "PRODUCT",
                ),
                titleTextStyle: const TextStyle(
                    color: white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              body: Container(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: width > 1000
                            ? 5
                            : width > 800
                                ? 4
                                : 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ProductEditPage(
                                data: data[index],
                                images: [data[index]["p_images"]],
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    data[index]["p_images"][0],
                                    fit: BoxFit.cover,
                                    height: 100,
                                    cacheHeight: 100,
                                  )),
                              Text(
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                data[index]["p_name"].toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "RS ${data[index]["p_price"]}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: redColor),
                              ),
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
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: white,
                onPressed: () {
                  Get.to(() => const AddProduct());
                },
                child: const Icon(
                  Icons.add,
                  color: fontGrey,
                ),
              ),
            );
          }
        });
  }
}
