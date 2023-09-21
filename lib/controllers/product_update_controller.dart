import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:get/get.dart';

class ProductUpdatecontroller extends GetxController {
  var isLoading = false.obs;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController opricecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController qtycontroller = TextEditingController();
  TextEditingController categorycontroller = TextEditingController();
  TextEditingController subcategorycontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  productUpdate(
      {name, oprice, price, qty, category, subcategory, desc, docid}) async {
    var store = firestore.collection(productCollection).doc(docid);
    isLoading(true);
    await store.set({
      'pname': name,
      "p_oprice": oprice,
      "p_price": price,
      "p_qty": qty,
      "p_category": category,
      "p_subcategory": subcategory,
      "p_desc": desc,
    }, SetOptions(merge: true)).then(
      (value) => isLoading(false),
    );
  }
}
