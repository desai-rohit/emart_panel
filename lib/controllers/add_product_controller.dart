// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:ecommerse_seller_dev_app/const/const.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddController extends GetxController {
  var profileimagepath = [].obs;
  var profileimagelink = [].obs;
  RxBool load = false.obs;
  var downUrl = "".obs;
  var downUrllist = [].obs;

  var pname = TextEditingController();
  var poprice = TextEditingController();
  var pprice = TextEditingController();
  var pqty = TextEditingController();
  var pcategory = TextEditingController();
  var psubcategory = TextEditingController();
  var pdes = TextEditingController();
  var pcolorname = TextEditingController();
  var pseller = TextEditingController();

  chnageImage(context) async {
    try {
      final img = await ImagePicker().pickMultiImage();
      if (img == null) return;
      profileimagepath.addAll(img);
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  Future<void> uploadProfileImage(context) async {
    for (var i = 0; i < profileimagepath.length; i++) {
      var FileName = File(profileimagepath[i].path);
      var destination = 'images/${currentUser!.uid}/$FileName';
      Reference ref = FirebaseStorage.instance.ref().child(destination);
      await ref.putFile(File(profileimagepath[i].path));

      profileimagelink.add(await ref.getDownloadURL());
    }
  }

  Future<void> addnewproduct(
      {colorproprti, imagelink, discount, category, productId, context}) async {
    load(true);
    await uploadProfileImage(context).then((value) async {
      var store = firestore.collection(productCollection).doc();
      await store.set({
        "p_images": imagelink,
        "colorsname": pcolorname.text,
        "colorproperti": colorproprti,
        "flash_seal": false,
        "p_discount": double.parse(discount.toStringAsFixed(2)),
        "p_category": category,
        "p_featured": false,
        "p_name": pname.text,
        "p_oprice": poprice.text,
        "p_price": pprice.text,
        "p_quantity": pqty.text,
        "p_reating": "4.5",
        "p_seller": pseller.text,
        "p_subcategory": psubcategory.text,
        "p_today_deals": false,
        "p_topbrand": true,
        "p_topseller": true,
        "sellerid": currentUser!.uid,
        "p_desc": pdes.text,
        "doc_id": store.id,
        "wishlist": [],
        "product_id": productId
      }).then((value) {
        load(false);
      });
    });
  }
}
