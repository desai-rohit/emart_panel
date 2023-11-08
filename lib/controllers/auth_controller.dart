import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  // text controller
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var reenterpasswordcontroller = TextEditingController();
  var namecontroller = TextEditingController();

  var loginemailcontroller = TextEditingController();
  var loginpasswordcontroller = TextEditingController();

  // var email = "".obs;
  //login method
  Future loginMethod(email, password, context) async {
    isLoading.isTrue;
    ChangeNotifier();

    // UserCredential? userCredential;
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      var authenticatedUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authenticatedUser.user!.emailVerified) {
        VxToast.show(context, msg: "Email Address Verified");
      } else {
        VxToast.show(context, msg: "Email Address Not Verified");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        VxToast.show(context, msg: "No User Found This Email");
      } else if (e.code == 'wrong-password') {
        VxToast.show(context, msg: "Wrong password provided for that user");
      }
    }
    isLoading.isFalse;
    ChangeNotifier();
  }

  Future<UserCredential?> signupMethod(email, password, context) async {
    UserCredential? userCredential;

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  storeUserData({
    name,
    password,
    email,
  }) async {
    DocumentReference store =
        firestore.collection(venderCOllection).doc(currentUser!.uid);
    store.set({
      "name": name,
      "password": password,
      "email": email,
      "image": "",
      "id": currentUser!.uid,
      "address": "",
    }, SetOptions(merge: true)).then(
        (value) => {emailcontroller.clear(), passwordcontroller.clear()});
  }

  //signOut Method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  bool passwwordvalidateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
