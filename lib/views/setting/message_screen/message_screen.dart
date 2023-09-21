import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/views/setting/message_screen/chat_screen.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(
              20,
              (index) => GestureDetector(
                    onTap: () {
                      Get.to(const ChatScreen());
                    },
                    child: const ListTile(
                      title: Text("Rohit desai"),
                      leading: Icon(Icons.person),
                      trailing: Column(
                        children: [Text("10.30"), Text("2/1/2023")],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
