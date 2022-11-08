import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/utils/colors.dart';

Future<void> main() async {
  //WidgetFlutterBinding kết nối giữa Widget và Flutter Engine
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCieLgjKYxlO6Ax8bhVwPrTczTxGDLs0yg",
        appId: "1:950918523575:web:2cdfff0ef4c980629c3b32",
        messagingSenderId: '950918523575',
        projectId: 'instagram-flutter-bd228',
        storageBucket: "instagram-flutter-bd228.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram FLutter',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      //StreamBuilder là một widget trong Flutter, dùng để đọc dữ liệu từ Stream và xây dựng phần logic cho UI.
      //Stream là một chuỗi asynchronous data ví dụ như : các event từ người dùng hay chuỗi dữ liệu được đọc từ file.
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //Nếu đăng nhập thành công
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              //Nếu có dữ liệu thì chuyển tới giao diện đáp ứng
              return const ResponsiveLayout(
                webScreenLayout: WebScreenLayout(),
                mobileScreenLayout: MobileScreenLayout(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

          return const LoginScreen();
        },
      ),
    );
  }
}

//1:23:09