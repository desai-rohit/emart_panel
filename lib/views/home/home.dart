import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/controllers/home_scntroller.dart';
import 'package:ecommerse_seller_dev_app/views/Order/order_screen.dart';
import 'package:ecommerse_seller_dev_app/views/Prodcut/product_screen.dart';
import 'package:ecommerse_seller_dev_app/views/home/home_screen.dart';
import 'package:ecommerse_seller_dev_app/views/no_internet/no_internet.dart';
import 'package:ecommerse_seller_dev_app/views/no_internet/provider_internet.dart';
import 'package:ecommerse_seller_dev_app/views/setting/setting%20Screen/setting_screen.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
 var controller = Get.put(ProviderInternet()); 

 controller.startMonitoring();
    super.initState();
  }
  //int index = 0;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
     var providerinternet = Get.put(ProviderInternet()); 

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
                  child: providerinternet.isOnline.value? IndexedStack(
                index: controller.navIndex.value,
                children: navScreen,
              ):const NoInternet()
              )
              )
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
