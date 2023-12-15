import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:messenger/models/apis.dart';
import 'common/app_colors.dart';
import 'common/app_text_style.dart';
import 'firebase_options.dart';
import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  _initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chateo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: APIs.auth.currentUser != null
          ? const HomeScreen()
          : const MyHomePage(title: ""),
      //const MyHomePage(title: "",),
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

Future<UserCredential?> signInWithGoogle() async {
  try {
    await InternetAddress.lookup('google.com');
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print('signInWithGoogle: $e');
  }
  ;
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
            onTap: () async {
              signInWithGoogle().then((user) async {
                if (user != null) {
                  if ((await APIs.userExists())) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  } else {
                    await APIs.createUser().then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HomeScreen()));
                    });
                  }
                }
              });
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

_initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FlutterNotificationChannel.registerNotificationChannel(
      description: 'For Showing Message Notification',
      id: 'chats',
      importance: NotificationImportance.IMPORTANCE_HIGH,
      name: 'Chats');
}
