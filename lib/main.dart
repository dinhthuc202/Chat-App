import 'package:flutter/material.dart';
import 'package:test02/home_screen.dart';
import 'package:test02/input_phone_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: "",),
      home: const HomeScreen(),
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
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:60),
            child: Center(child: Image.asset("assets/images/img_background.png",),),
          ),
          const SizedBox(height: 42,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Center(
              child: Text(
                "Connect easily with your family and friends over contries",
                style: TextStyle(
                  color: Color(0xFF0F1828),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 126,),
          const Center(
            child: Text(
                "Terms & Privacy Policy",
              style: TextStyle(
                color: Color(0xFF0F1828),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16,),
          InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InputPhoneNumber(),
                ),
              );
            },
            child: Center(
              child: Card(
                margin: const EdgeInsets.only(bottom: 34),
                child: Container(
                  height: 52,
                  width: 327,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    color: const Color(0xFF002DE3),
                  ),
                  child: const Center(
                    child: Text(""
                        "Start Messaging",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
        ),
            ),
          )
        ],
      ),
    );
  }
}
