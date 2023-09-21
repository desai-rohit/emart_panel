import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  // text controller
  var emailcontroller = TextEditingController().obs;
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var email = "".obs;
  //login method
  Future<UserCredential?> loginMethod(context) async {
    UserCredential? userCredential;

    try {
      await auth.signInWithEmailAndPassword(
          email: emailcontroller.value.text, password: passwordcontroller.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  storeUserData({name, password, email, address}) async {
    DocumentReference store =
        firestore.collection(venderCOllection).doc(currentUser!.uid);
    store.set({
      "name": name,
      "password": password,
      "email": email,
      "image": "",
      "id": currentUser!.uid,
      "address": address,
    }, SetOptions(merge: true)).then(
        (value) => {emailcontroller.value.clear(), passwordcontroller.clear()});
  }

  //signOut Method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
