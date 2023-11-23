import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 14,left: 24,bottom: 13,),
            child: SizedBox(
              height: 30,
              child: Text(
                  "More",
                style: TextStyle(
                  color: Color(0xFF0F1828),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal:16 ),
            child: Container(
              width: 375,
              height: 66,
              decoration: const BoxDecoration(
                ///color: Colors.amber,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDEDED),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(
                          "assets/vectors/profile_avata.svg",
                          width: 16,
                          height: 19,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20,bottom: 15,top: 5,right: 116,),
                    child: Container(
                      width: 134,
                      height: 46,
                      child: const Column(
                        children: [
                          SizedBox(
                            width: 126.68,
                            height: 24,
                            child: Text(
                                "Almayra Zamzamy",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF0F1828),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: SizedBox(
                              width: 134,
                              height: 20,
                              child: Text(
                                "+62 1309 - 1710 - 1920",
                                style: TextStyle(
                                  color: Color(0xFFADB5BD),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
