import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/home_scntroller.dart';
import 'package:ecommerse_seller_dev_app/views/Order/Order_screen.dart';
import 'package:ecommerse_seller_dev_app/views/Prodcut/Product_screen.dart';
import 'package:ecommerse_seller_dev_app/views/home/Home_screen.dart';
import 'package:ecommerse_seller_dev_app/views/setting/setting%20Screen/setting_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  //int index = 0;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navScreen = [
      const HomeScreen(),
      const ProductScreen(),
      const OrderScreen(),
      const SettingScreen()
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
                  child: IndexedStack(
                index: controller.navIndex.value,
                children: navScreen,
              )))
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.navIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          unselectedItemColor: Colors.black,
          onTap: (value) {
            controller.navIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2), label: "Product"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Order"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ],
        ),
      ),
    );
  }
}
