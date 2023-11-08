import 'package:ecommerse_seller_dev_app/const/const.dart';
import 'package:ecommerse_seller_dev_app/firebase_options.dart';
import 'package:ecommerse_seller_dev_app/views/auth/login_screen.dart';
import 'package:ecommerse_seller_dev_app/views/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  var isUserLogged = false;

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        isUserLogged = false;
      } else {
        isUserLogged = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      home: isUserLogged ? const Home() : const LoginScreen(),
      theme: ThemeData(
        primarySwatch: Colors.red,

        // appBarTheme: const AppBarTheme(

        //     backgroundColor: Colors.transparent, elevation: 0.0)
      ),
    );
  }
}
