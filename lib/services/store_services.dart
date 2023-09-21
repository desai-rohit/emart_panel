import 'package:ecommerse_seller_dev_app/const/const.dart';

class StoreServices {
  static getProfile() {
    return firestore
        .collection(venderCOllection)
        .where("id", isEqualTo: currentUser!.uid)
        .get();
  }

  static getlogin(String emailAddress) {
    return firestore
        .collection(venderCOllection)
        .where("email", isEqualTo: emailAddress)
        .snapshots();
  }

  static getProduct() {
    return firestore
        .collection(productCollection)
        .where("sellerid", isEqualTo: currentUser!.uid)
        .get();
  }

  static getPopularProduct() {
    return firestore
        .collection(productCollection)
        .where("sellerid", isEqualTo: currentUser!.uid)
        .where("p_popular", isEqualTo: true)
        .get();
  }

  static getOrderProduct(uid) {
    return firestore
        .collection(orderCollection)
        .where("venderId", isEqualTo: uid)
        .snapshots();
  }

  static getTotalProduct() {
    return firestore
        .collection(orderCollection)
        .where("venderId", isEqualTo: currentUser!.uid)
        .snapshots();
  }
}
