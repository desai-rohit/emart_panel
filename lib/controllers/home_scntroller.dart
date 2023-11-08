import 'package:get/get.dart';

class HomeController extends GetxController {
  var navIndex = 0.obs;

      List totalRating = [];
      List tottalratinguser = [];
      RxDouble sum = 0.0.obs;
      RxDouble rating = 0.0.obs;



      ratingsum(){
           sum.value = totalRating.reduce((a, b) => a+b);
      }

      tottalrating(){
        rating.value =  sum/tottalratinguser.length;
      }

}
