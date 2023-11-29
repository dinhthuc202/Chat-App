import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messenger/common/app_text_style.dart';
import 'package:messenger/firebase_options.dart';
import 'package:messenger/services/isar_service.dart';

import 'common/app_colors.dart';
import 'home_screen.dart';
import 'input_phone_number.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      ///Tắt debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const MyHomePage(title: "",),
      //home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Center(
              child: Image.asset(
                "assets/images/img_background.png",
              ),
            ),
          ),
          const SizedBox(
            height: 42,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Center(
              child: Text(
                "Connect easily with your family and friends over contries",
                style: AppTextStyle.primaryS24W700,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 126,
          ),
          Center(
            child: Text(
              "Terms & Privacy Policy",
              style: AppTextStyle.primaryS14W600,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () async{
              ///Mở isarService
              final isarService = IsarService();

              ///Lấy về số điện thoại đã lưu
              final phones = await isarService.getAllPhoneNumbers();

              ///Kiểm tra xem đã có sdt đăng nhập chưa
              ///Chưa có --> chuyển qua nhập sdt
              ///Có rồi chuyển về màn hình Home
              if(phones.isNotEmpty){
                if(context.mounted){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }
              } else {
                if(context.mounted){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InputPhoneNumber(),
                    ),
                  );
                }
              }
            },
            child: Center(
              child: Card(
                margin: const EdgeInsets.only(bottom: 34),
                child: Container(
                  height: 52,
                  width: 327,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    color: AppColors.colorPrimary,
                  ),
                  child: Center(
                    child: Text(
                      "Start Messaging",
                      style: AppTextStyle.primaryS14W600.copyWith(
                        color: AppColors.textButtonPrimary,
                      ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
