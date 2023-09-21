import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/services/store_services.dart';

Widget firebaseOrderBilder({Widget? widget}) {
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

        return widget!;
      }
    },
  );
}
