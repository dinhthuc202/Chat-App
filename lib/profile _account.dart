import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAccount extends StatefulWidget {
  const ProfileAccount({super.key});

  @override
  State<ProfileAccount> createState() => _ProfileAccountState();
}

class _ProfileAccountState extends State<ProfileAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 14,bottom: 59,),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 16,
                          ),
                          child: SvgPicture.asset(
                            "assets/vectors/ic_arrow_left.svg",
                          ),
                        ),
                      ),
                      const Text(
                        "Your Profile",
                        style: TextStyle(
                          color: Color(0xFF0F1828),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F7FC),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 22,right: 22,left: 22,),
                              child: SizedBox(
                              width: 56,
                              height: 56,
                              child: SvgPicture.asset(
                                "assets/vectors/profile_avata.svg",
                                width: 37.33,
                                height: 44.33,
                                fit: BoxFit.scaleDown,
                              ),
                          ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5,left: 75,bottom: 1),
                              child: SvgPicture.asset(
                                "assets/vectors/ic_plus_circle.svg",
                                fit: BoxFit.scaleDown,
                                width: 20,
                                height: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 327,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFF7F7FC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: "First Name (Required)",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Color(0xFFADB5BD),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:12,bottom: 68,),
                        child: Container(
                          width: 327,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color(0xFFF7F7FC),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: "Last Name (Optional)",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color(0xFFADB5BD),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 52,
                        width: 327,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(38),
                          color: const Color(0xFF002DE3),
                        ),
                        child: const Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
