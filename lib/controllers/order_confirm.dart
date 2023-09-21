import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:get/get.dart';

class OrderConfirmcontroller extends GetxController {
  var confirmisloading = false.obs;
  QueryDocumentSnapshot? snapshotData;
  var orderconfirmed = false.obs;
  var orderShip = false.obs;
  var shipisloading = false.obs;
  

  orderConfirmtrue({orderConfirm, docid}) async {
    confirmisloading(true);
    var store = firestore.collection(orderCollection).doc(docid);
    await store.set({
      "order_confirmed": true,
    }, SetOptions(merge: true)).then((value) {
      orderconfirmed(true);
      confirmisloading(false);
    });
  }

  
  orderConfirmfalse({orderConfirm, docid}) async {
    confirmisloading(true);
    var store = firestore.collection(orderCollection).doc(docid);
    await store.set({
      "order_confirmed": false,
    }, SetOptions(merge: true)).then((value) {
      orderconfirmed(false);
      confirmisloading(false);
    });
  }


  orderShiptrue({orderConfirm, docid}) async {
    shipisloading(true);
    var store = firestore.collection(orderCollection).doc(docid);
    await store.set({
      "order_on_delivery": true,
    }, SetOptions(merge: true)).then((value) {
      orderShip(true);
      shipisloading(false);
    });
  }

  
  orderShipfalse({orderConfirm, docid}) async {
    shipisloading(true);
    var store = firestore.collection(orderCollection).doc(docid);
    await store.set({
      "order_on_delivery": false,
    }, SetOptions(merge: true)).then((value) {
      orderShip(false);
      shipisloading(false);
    });
  }
}
